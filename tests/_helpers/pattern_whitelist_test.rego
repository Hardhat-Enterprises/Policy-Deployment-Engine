package terraform.helpers.policies.pattern_whitelist_test

# Pattern Whitelist Policy Test Suite
#
# Tests the pattern whitelist policy module which detects resources where
# wildcard-extracted substrings DON'T match allowed patterns.
# Uses target patterns with * wildcards to extract values, then validates each
# against position-specific whitelists (inverted logic from blacklist).

import data.terraform.helpers.policies.pattern_whitelist
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test pattern matching logic
# ==============================================================================

# Test 1: Exact match in whitelist (boundary: match - should pass)
test_matches_whitelist_exact_match if {
	pattern_whitelist._matches_whitelist(["allowed", "permitted"], "allowed")
}

# Test 2: No match in whitelist (boundary: no match - should fail)
test_matches_whitelist_no_match if {
	not pattern_whitelist._matches_whitelist(["allowed", "permitted"], "forbidden")
}

# Test 3: Single wildcard pattern - all positions whitelisted (no violation)
test_get_whitelist_single_wildcard_all_match if {
	# Mock resource with values matching whitelist
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "prod-project",
			"parent": "projects/prod-project/locations/us-central1",
		},
	}

	# Target pattern with 2 wildcards
	target := "projects/*/locations/*"
	# Whitelist patterns: first position ["prod-project"], second position ["us-central1"]
	patterns := [["prod-project"], ["us-central1"]]

	whitelist := pattern_whitelist._get_whitelist(mock_resource, ["parent"], target, patterns)

	# Should find 0 violations (all positions whitelisted)
	count(whitelist) == 0
}

# Test 4: Single wildcard pattern - one position not whitelisted (violation)
test_get_whitelist_single_wildcard_violation if {
	# Mock resource with non-whitelisted value
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "test-project",
			"parent": "projects/test-project/locations/us-east1",
		},
	}

	target := "projects/*/locations/*"
	patterns := [["prod-project"], ["us-central1"]]

	whitelist := pattern_whitelist._get_whitelist(mock_resource, ["parent"], target, patterns)

	# Should find 2 violations (both positions not whitelisted)
	count(whitelist) == 2
	values := {w.value | some w in whitelist}
	values == {"test-project", "us-east1"}
}

# Test 5: Multiple patterns with OR logic within position
test_get_whitelist_multiple_patterns_or_logic if {
	# Mock with value matching one of multiple allowed patterns at a position
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "staging-project",
			"parent": "projects/staging-project/locations/us-central1",
		},
	}

	target := "projects/*/locations/*"
	# First position: ["prod-project", "staging-project"] (OR logic)
	# Second position: ["us-central1"]
	patterns := [["prod-project", "staging-project"], ["us-central1"]]

	whitelist := pattern_whitelist._get_whitelist(mock_resource, ["parent"], target, patterns)

	# Should match both positions (staging-project matches first, us-central1 matches second)
	# No violations
	count(whitelist) == 0
}

# ==============================================================================
# MOCK DATA PROVENANCE
# ==============================================================================
# Minimal mocks in tests 6-7 are synthetic, designed to test specific logic paths.
# They represent simplified hierarchical patterns (folders/*/projects/*).
#
# Reality check (test 8) uses: tests/_helpers/fixtures/gcp_project/plan.json
# Source: inputs/gcp/cloud_platform_service/google_project/project_id/
# Purpose: Tests pattern validation on actual project_id values (see pattern_blacklist_test.rego)
# ==============================================================================

# Test 6: get_violations with minimal mock
test_get_violations_minimal if {
	# Minimal mock with non-whitelisted pattern
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_project",
						"values": {
							"name": "dev-project",
							"parent": "folders/dev-folder/projects/test-app",
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Whitelist pattern: folders/*/projects/* where project is "prod-app" only
	# First wildcard (folder) allows any value, second (project) restricted
	violations := pattern_whitelist.get_violations(
		tf_variables,
		["parent"],
		["folders/*/projects/*", [["dev-folder", "prod-folder"], ["prod-app"]]],
	) with input as mock_input

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)
	count(violations) == 1
	
	# Verify violation structure (violates because project is "test-app" not "prod-app")
	some v in violations
	v.name == "dev-project"
	shared_test._assert_valid_violation(v)
	contains(v.message, "dev-project")           # Resource name
	contains(v.message, "'test-app'")            # Violating value
	contains(v.message, "should be set to one of") # Verdict
}

# ==============================================================================
# INTEGRATION TEST (1): Complex whitelist patterns
# ==============================================================================

# Test 7: get_violations with realistic complex patterns
test_get_violations_realistic if {
	# Realistic mock with multiple wildcards and edge cases
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Resource with non-whitelisted pattern (single position fails)
					{
						"type": "google_project",
						"values": {
							"name": "violating-project",
							"parent": "organizations/12345/folders/dev-folder",
						},
					},
					# Resource with multiple position failures (CRITICAL TEST CASE)
					{
						"type": "google_project",
						"values": {
							"name": "multi-fail-project",
							"parent": "organizations/99999/folders/test-folder",
						},
					},
					# Resource with whitelisted pattern
					{
						"type": "google_project",
						"values": {
							"name": "compliant-project",
							"parent": "organizations/12345/folders/prod-folder",
						},
					},
					# Resource with null parent (edge case)
					{
						"type": "google_project",
						"values": {
							"name": "null-project",
							"parent": null,
						},
					},
					# Different resource type (should be ignored)
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "test-bucket",
							"parent": "organizations/12345/folders/dev-folder",
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Pattern with 2 wildcards: organizations/*/folders/*
	# Whitelist both positions to ensure only one violation per resource
	# First position (org): allow "12345", second position (folder): ["prod-folder", "staging-folder"]
	violations := pattern_whitelist.get_violations(
		tf_variables,
		["parent"],
		["organizations/*/folders/*", [["12345"], ["prod-folder", "staging-folder"]]],
	) with input as mock_input

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)
	
	# Should flag 2 projects: violating-project (single position) and multi-fail-project (both positions)
	count(violations) == 2
	violation_name_set := {v.name | some v in violations}
	violation_name_set == {"violating-project", "multi-fail-project"}
	
	every violation in violations {
		shared_test._assert_valid_violation(violation)
		contains(violation.message, "Project")
		contains(violation.message, "parent")
	}
	
	# Verify single-failure message
	some single_violation in violations
	single_violation.name == "violating-project"
	contains(single_violation.message, "should be set to one of")
	contains(single_violation.message, "'dev-folder'")
	
	# Verify multi-failure message mentions multiple positions
	some multi_violation in violations
	multi_violation.name == "multi-fail-project"
	# Message should indicate multiple positions failed
	contains(multi_violation.message, "Multiple positions failed")
}

# ==============================================================================
# CRITICAL TESTS (2): Multiple failures and functional purity
# ==============================================================================

# Test 9: Multiple position failures per resource (THE BUG THAT WAS MISSED)
test_get_violations_multiple_failures_per_resource if {
	# This test validates the fix for eval_conflict_error
	# When a resource fails multiple pattern positions, _build_violation must
	# return exactly ONE violation object (not multiple)
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Resource failing ALL 3 positions
					{
						"type": "google_project",
						"values": {
							"name": "bad-project",
							"project_id": "bad-wrong-invalid",
						},
					},
					# Resource failing 2 positions
					{
						"type": "google_project",
						"values": {
							"name": "partial-bad",
							"project_id": "proj-bad-bad",
						},
					},
					# Compliant resource
					{
						"type": "google_project",
						"values": {
							"name": "good-project",
							"project_id": "proj-app-dev",
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Pattern: *-*-* with strict whitelist (most resources will fail)
	violations := pattern_whitelist.get_violations(
		tf_variables,
		["project_id"],
		["*-*-*", [["proj"], ["app", "sec"], ["dev", "prod"]]],
	) with input as mock_input

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)

	# CRITICAL: Must return exactly 1 violation per resource (not 3 for bad-project)
	count(violations) == 2

	# Verify structure of resource with 3 position failures
	some v1 in violations
	v1.name == "bad-project"
	is_string(v1.message)
	# Message must mention multiple failures
	contains(v1.message, "Multiple positions failed")

	# Verify structure of resource with 2 position failures
	some v2 in violations
	v2.name == "partial-bad"
	is_string(v2.message)
}

# Test 10: Functional purity - _build_violation returns single output
test_build_violation_functional_purity if {
	# This test ensures _build_violation never produces multiple outputs
	# for the same inputs (Rego functional semantics requirement)
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "test-project",
			"project_id": "fail-fail-fail",
		},
	}

	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Call _build_violation with resource that fails all 3 positions
	# This would have caused eval_conflict_error before the fix
	violation := pattern_whitelist._build_violation(
		tf_variables,
		["project_id"],
		["*-*-*", [["good"], ["good"], ["good"]]],
		mock_resource,
	)

	# Must return exactly ONE violation object
	is_object(violation)
	violation.name == "test-project"
	is_string(violation.message)
	violation.message != ""

	# Verify deterministic behavior - calling twice yields same result
	violation2 := pattern_whitelist._build_violation(
		tf_variables,
		["project_id"],
		["*-*-*", [["good"], ["good"], ["good"]]],
		mock_resource,
	)
	violation == violation2
}

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================

# Test 8: get_violations with real Terraform plan
test_get_violations_with_real_terraform_plan if {
	# Use real fixture - gcp_project from fixtures
	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Test with real data - whitelist specific patterns
	# If project has parent with hierarchical structure
	violations := pattern_whitelist.get_violations(
		tf_variables,
		["parent"],
		["organizations/*/folders/*", [[], ["prod", "production", "main"]]],
	) with input as data.gcp_project_plan

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)
	
	# Verify no crashes and proper structure
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Project")
		contains(v.message, "should be set to one of")
	}
}

# Test 11: Utilize fixture attribute - project_id pattern from project
test_project_id_fixture if {
	# Test using actual project_id patterns from gcp_project_plan
	# Whitelist only dev projects with allowed teams
	tf_variables := {
		"resource_type": "google_project",
		"resource_value_name": "name",
		"friendly_resource_name": "Project",
	}

	# Pattern "proj-*-*" matches: proj-app-dev, proj-sec-prod, proj-app-prod, proj-ops-staging
	# Whitelist: first position can be "app", second position can be "dev"
	# Only proj-app-dev (c123) matches both → compliant
	# Violations: c223 (proj-sec-prod), c323 (proj-app-prod), nc223 (proj-ops-staging)
	violations := pattern_whitelist.get_violations(
		tf_variables,
		["project_id"],
		["proj-*-*", [["app"], ["dev"]]],
	) with input as data.gcp_project_plan

	# 3 projects match pattern but don't meet whitelist criteria
	count(violations) == 3
	violation_names := {v.name | some v in violations}
	violation_names == {"c223", "c323", "nc223"}

	every v in violations {
		contains(v.message, "project_id")
	}
}
