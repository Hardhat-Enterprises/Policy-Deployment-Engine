package terraform.helpers.policies.pattern_blacklist_test

# Pattern Blacklist Policy Test Suite
#
# Tests the pattern blacklist policy module which detects resources where
# wildcard-extracted substrings match forbidden patterns.
# Uses target patterns with * wildcards to extract values, then checks against
# position-specific blacklists.

import data.terraform.helpers.policies.pattern_blacklist
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test pattern matching logic
# ==============================================================================

# Test 1: Exact match in blacklist (boundary: match)
test_matches_blacklist_exact_match if {
	pattern_blacklist._matches_blacklist(["forbidden", "banned"], "forbidden")
}

# Test 2: No match in blacklist (boundary: no match)
test_matches_blacklist_no_match if {
	not pattern_blacklist._matches_blacklist(["forbidden", "banned"], "allowed")
}

# Test 3: Single wildcard pattern match
test_get_blacklist_single_wildcard_match if {
	# Mock resource with hierarchical pattern
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "test-project",
			"parent": "projects/test-project/locations/us-east1",
		},
	}

	# Target pattern with 2 wildcards
	target := "projects/*/locations/*"
	# Blacklist patterns: first position ["test-project"], second position ["us-east1"]
	patterns := [["test-project"], ["us-east1"]]

	blacklist := pattern_blacklist._get_blacklist(mock_resource, ["parent"], target, patterns)

	# Should find 2 matches (both positions blacklisted)
	count(blacklist) == 2
	
	# Verify both positions are flagged
	values := {b.value | some b in blacklist}
	values == {"test-project", "us-east1"}
}

# Test 4: Single wildcard pattern no match
test_get_blacklist_single_wildcard_no_match if {
	# Mock resource with different values
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "prod-project",
			"parent": "projects/prod-project/locations/us-central1",
		},
	}

	target := "projects/*/locations/*"
	patterns := [["test-project"], ["us-east1"]]

	blacklist := pattern_blacklist._get_blacklist(mock_resource, ["parent"], target, patterns)

	# Should find no matches
	count(blacklist) == 0
}

# Test 5: Multiple patterns with OR logic within position
test_get_blacklist_multiple_patterns_or_logic if {
	# Mock with value matching one of multiple patterns at a position
	mock_resource := {
		"type": "google_project",
		"values": {
			"name": "dev-project",
			"parent": "projects/dev-project/locations/us-east1",
		},
	}

	target := "projects/*/locations/*"
	# First position: ["test-project", "dev-project"] (OR logic - full extracted strings)
	# Second position: ["us-east1"]
	patterns := [["test-project", "dev-project"], ["us-east1"]]

	blacklist := pattern_blacklist._get_blacklist(mock_resource, ["parent"], target, patterns)

	# Should match both positions (dev-project matches first, us-east1 matches second)
	count(blacklist) == 2
	values := {b.value | some b in blacklist}
	values == {"dev-project", "us-east1"}
}

# ==============================================================================
# MOCK DATA PROVENANCE
# ==============================================================================
# Minimal mocks in tests 6-7 are synthetic, designed to test specific logic paths.
# They represent simplified hierarchical patterns (organizations/*/folders/*).
#
# Reality check (test 8) uses: tests/_helpers/fixtures/gcp_project/plan.json
# Source: inputs/gcp/cloud_platform_service/google_project/project_id/
# Purpose: Tests pattern extraction on actual project_id values:
#   - c123: project_id="proj-app-dev" (pattern: proj-*-*)
#   - c223: project_id="proj-sec-prod" (pattern: proj-*-*)
# ==============================================================================

# Test 6: get_violations with minimal mock
test_get_violations_minimal if {
	# Minimal mock with blacklisted pattern
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_project",
						"values": {
							"name": "test-project",
							"parent": "organizations/123456/folders/test-folder",
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

	# Blacklist pattern: organizations/*/folders/* where folder is "test-folder"
	violations := pattern_blacklist.get_violations(
		tf_variables,
		["parent"],
		["organizations/*/folders/*", [[], ["test-folder"]]],
	) with input as mock_input

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)
	count(violations) == 1
	
	some v in violations
	v.name == "test-project"
	shared_test._assert_valid_violation(v)
	contains(v.message, "test-project")   # Resource name
	contains(v.message, "'test-folder'")  # Violating value
	contains(v.message, "blacklisted")    # Verdict
}

# ==============================================================================
# INTEGRATION TEST (1): Complex wildcard patterns
# ==============================================================================

# Test 7: get_violations with realistic complex patterns
test_get_violations_realistic if {
	# Realistic mock with multiple wildcards and edge cases
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Resource with blacklisted pattern at one position
					{
						"type": "google_project",
						"values": {
							"name": "violating-project",
							"parent": "organizations/12345/folders/dev-folder",
						},
					},
					# Resource with multiple blacklisted positions (CRITICAL TEST CASE)
					{
						"type": "google_project",
						"values": {
							"name": "multi-fail-project",
							"parent": "organizations/bad-org/folders/dev-folder",
						},
					},
					# Resource with compliant pattern
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
	# Blacklist: org "bad-org" and folder "dev-folder"
	violations := pattern_blacklist.get_violations(
		tf_variables,
		["parent"],
		["organizations/*/folders/*", [["bad-org"], ["dev-folder"]]],
	) with input as mock_input

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)
	
	# Should flag 2 projects: violating-project (single position) and multi-fail-project (both positions)
	count(violations) == 2
	violation_name_set := {v.name | some v in violations}
	violation_name_set == {"violating-project", "multi-fail-project"}
	
	every violation in violations {
		is_string(violation.name)
		is_string(violation.message)
		violation.name != ""
		violation.message != ""
		contains(violation.message, "Project")
		contains(violation.message, "parent")
		contains(violation.message, "blacklisted")
	}
	
	# Verify single-failure message
	some single_violation in violations
	single_violation.name == "violating-project"
	contains(single_violation.message, "'dev-folder'")
	
	# Verify multi-failure message mentions multiple positions
	some multi_violation in violations
	multi_violation.name == "multi-fail-project"
	# Message should indicate multiple blacklist matches
	contains(multi_violation.message, "Multiple positions matched blacklist")
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

	# Test with real data - blacklist a pattern that might exist
	# If project has parent with hierarchical structure
	violations := pattern_blacklist.get_violations(
		tf_variables,
		["parent"],
		["organizations/*/folders/*", [[], ["test", "dev", "staging"]]],
	) with input as data.gcp_project_plan

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)
	
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Project")
		contains(v.message, "blacklisted")
	}
}

# ==============================================================================
# CRITICAL TESTS (2): Multiple failures and functional purity
# ==============================================================================

# Test 9: Multiple position failures per resource (THE BUG THAT WAS MISSED)
test_get_violations_multiple_failures_per_resource if {
	# This test validates the fix for eval_conflict_error
	# When a resource matches multiple blacklist positions, _build_violation must
	# return exactly ONE violation object (not multiple)
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Resource matching ALL 3 blacklisted positions
					{
						"type": "google_project",
						"values": {
							"name": "bad-project",
							"project_id": "test-dev-staging",
						},
					},
					# Resource matching 2 blacklisted positions
					{
						"type": "google_project",
						"values": {
							"name": "partial-bad",
							"project_id": "test-dev-prod",
						},
					},
					# Compliant resource
					{
						"type": "google_project",
						"values": {
							"name": "good-project",
							"project_id": "proj-app-prod",
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

	# Pattern: *-*-* with blacklist on all positions
	violations := pattern_blacklist.get_violations(
		tf_variables,
		["project_id"],
		["*-*-*", [["test"], ["dev"], ["staging"]]],
	) with input as mock_input

	# Property: Returns a set with no duplicate resource names
	shared_test._assert_unique_violations(violations)

	# CRITICAL: Must return exactly 1 violation per resource (not 3 for bad-project)
	count(violations) == 2

	some v1 in violations
	v1.name == "bad-project"
	is_string(v1.message)
	# Message must mention multiple blacklist matches
	contains(v1.message, "Multiple positions matched blacklist")

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
			"project_id": "bad-bad-bad",
		},
	}

	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Call _build_violation with resource that matches all 3 blacklist positions
	# This would have caused eval_conflict_error before the fix
	violation := pattern_blacklist._build_violation(
		tf_variables,
		["project_id"],
		["*-*-*", [["bad"], ["bad"], ["bad"]]],
		mock_resource,
	)

	# Must return exactly ONE violation object
	is_object(violation)
	violation.name == "test-project"
	is_string(violation.message)
	violation.message != ""

	# Verify deterministic behavior - calling twice yields same result
	violation2 := pattern_blacklist._build_violation(
		tf_variables,
		["project_id"],
		["*-*-*", [["bad"], ["bad"], ["bad"]]],
		mock_resource,
	)
	violation == violation2
}

# Test 11: Utilize fixture attribute - project_id pattern from project
test_project_id_fixture if {
	# Test using actual project_id patterns from gcp_project_plan
	# Blacklist production projects matching pattern "proj-*-prod"
	tf_variables := {
		"resource_type": "google_project",
		"friendly_resource_name": "Project",
		"resource_value_name": "name",
	}

	# Pattern "proj-*-prod" extracts middle segment
	# Blacklist middle segments: "sec" and "app"
	# Should match: proj-sec-prod (c223), proj-app-prod (c323)
	violations := pattern_blacklist.get_violations(
		tf_variables,
		["project_id"],
		["proj-*-prod", [["sec", "app"]]],
	) with input as data.gcp_project_plan

	# c223 has project_id "proj-sec-prod" and c323 has "proj-app-prod"
	count(violations) == 2
	violation_names := {v.name | some v in violations}
	violation_names == {"c223", "c323"}

	every v in violations {
		contains(v.message, "project_id")
		contains(v.message, "prod")
	}
}
