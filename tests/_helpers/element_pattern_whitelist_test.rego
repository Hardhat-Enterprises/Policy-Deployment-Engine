package terraform.helpers.policies.element_pattern_whitelist_test

# Element Pattern Whitelist Policy Test Suite
#
# Tests the element pattern whitelist policy module which flags array
# attributes where any element does NOT match a required wildcard shape
# (e.g. projects/*/locations/*/apps/*/guardrails/*), where '*' matches one
# or more non-'/' characters (a single path segment).

import data.terraform.helpers.policies.element_pattern_whitelist
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test _get_resources and get_violations with simple mocks
# ==============================================================================

# Test 1: A single non-matching element (bare name) flags the resource
test_get_resources_single_bad_element if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_ces_agent",
						"name": "bare-name-agent",
						"values": {"guardrails": ["approved-guardrail"]},
					},
				],
			},
		},
	}

	resources := element_pattern_whitelist._get_resources(
		"google_ces_agent",
		["guardrails"],
		"projects/*/locations/*/apps/*/guardrails/*",
	) with input as mock_input

	count(resources) == 1
	some r in resources
	r.name == "bare-name-agent"
}

# Test 2: A valid full resource path is not flagged
test_get_resources_compliant_full_path if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_ces_agent",
						"name": "compliant-agent",
						"values": {"guardrails": ["projects/p/locations/l/apps/a/guardrails/g"]},
					},
				],
			},
		},
	}

	resources := element_pattern_whitelist._get_resources(
		"google_ces_agent",
		["guardrails"],
		"projects/*/locations/*/apps/*/guardrails/*",
	) with input as mock_input

	count(resources) == 0
}

# Test 3: Mixed elements - one bad element flags the whole resource
test_get_resources_mixed_elements if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_ces_agent",
						"name": "mixed-agent",
						"values": {"guardrails": [
							"projects/p/locations/l/apps/a/guardrails/g",
							"bare-name",
						]},
					},
				],
			},
		},
	}

	resources := element_pattern_whitelist._get_resources(
		"google_ces_agent",
		["guardrails"],
		"projects/*/locations/*/apps/*/guardrails/*",
	) with input as mock_input

	count(resources) == 1
	some r in resources
	r.name == "mixed-agent"
}

# Test 4: A path with missing segments is flagged
test_get_resources_wrong_shape if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_ces_agent",
						"name": "wrong-shape-agent",
						"values": {"guardrails": ["projects/p/guardrails/g"]},
					},
				],
			},
		},
	}

	resources := element_pattern_whitelist._get_resources(
		"google_ces_agent",
		["guardrails"],
		"projects/*/locations/*/apps/*/guardrails/*",
	) with input as mock_input

	count(resources) == 1
	some r in resources
	r.name == "wrong-shape-agent"
}

# Test 5: An empty list has no elements to fail, so it is not flagged
test_get_resources_empty_list if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_ces_agent",
						"name": "empty-agent",
						"values": {"guardrails": []},
					},
				],
			},
		},
	}

	resources := element_pattern_whitelist._get_resources(
		"google_ces_agent",
		["guardrails"],
		"projects/*/locations/*/apps/*/guardrails/*",
	) with input as mock_input

	count(resources) == 0
}

# Test 6: Resources of a different type are ignored
test_get_resources_ignores_other_type if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"name": "other-bucket",
						"values": {"guardrails": ["bare-name"]},
					},
				],
			},
		},
	}

	resources := element_pattern_whitelist._get_resources(
		"google_ces_agent",
		["guardrails"],
		"projects/*/locations/*/apps/*/guardrails/*",
	) with input as mock_input

	count(resources) == 0
}

# ==============================================================================
# INTEGRATION TEST (1): get_violations across multiple resources
# ==============================================================================

# Test 7: get_violations returns valid violations for non-compliant resources
test_get_violations_integration if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_ces_agent",
						"name": "compliant_example_1",
						"values": {"guardrails": ["projects/p/locations/l/apps/a/guardrails/g"]},
					},
					{
						"type": "google_ces_agent",
						"name": "non_compliant_example_1",
						"values": {"guardrails": ["approved-guardrail"]},
					},
					{
						"type": "google_ces_agent",
						"name": "wrong_shape_1",
						"values": {"guardrails": ["projects/p/guardrails/g"]},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_ces_agent",
		"friendly_resource_name": "CES Agent",
		"resource_value_name": "name",
	}

	violations := element_pattern_whitelist.get_violations(
		tf_variables,
		["guardrails"],
		["projects/*/locations/*/apps/*/guardrails/*"],
	) with input as mock_input

	count(violations) == 2
	violation_names := {v.name | some v in violations}
	violation_names == {"non_compliant_example_1", "wrong_shape_1"}

	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "CES Agent")
		contains(v.message, "guardrails")
		contains(v.message, "projects/*/locations/*/apps/*/guardrails/*")
	}
}

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================

# Test 8: get_violations against the real access-level fixture (regions array)
test_real_plan_violations if {
	tf_variables := {
		"resource_type": "google_access_context_manager_access_level",
		"friendly_resource_name": "Access Level",
		"resource_value_name": "title",
	}

	violations := element_pattern_whitelist.get_violations(
		tf_variables,
		["basic", 0, "conditions", 0, "regions"],
		["projects/*/locations/*"],
	) with input as data.gcp_access_level_plan

	is_set(violations)
	count(violations) > 0
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Access Level")
		contains(v.message, "regions")
	}
}

