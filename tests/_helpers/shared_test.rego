package terraform.helpers.shared_test

# Shared Utilities Test Suite
#
# Tests the shared utility module which provides helper functions used by all policy types.
# Foundation tests - all other policy tests depend on these utilities working correctly.

import rego.v1

import data.terraform.helpers.shared

# ==============================================================================
# UNIT TESTS (10): Test individual utility functions
# ==============================================================================

# Test 1: get_resource_attribute - Happy Path
test_get_resource_attribute_found if {
	resource := {"values": {"name": "test-resource"}}
	result := shared.get_resource_attribute(resource, "name")
	result == "test-resource"
}

# Test 2: get_resource_attribute - Not Found
test_get_resource_attribute_not_found if {
	resource := {"values": {}}
	result := shared.get_resource_attribute(resource, "missing_key")
	result == null
}

# Test 3: format_attribute_path - Array Path
test_format_attribute_path_array if {
	path := ["status", 0, "restricted_services"]
	result := shared.format_attribute_path(path)
	result == "status.[0].restricted_services"
}

# Test 4: format_attribute_path - String Path
test_format_attribute_path_string if {
	path := "attribute_name"
	result := shared.format_attribute_path(path)
	result == "attribute name"
}

# Test 5: ensure_array - Already Array
test_ensure_array_with_array if {
	input_array := [1, 2, 3]
	result := shared.ensure_array(input_array)
	result == [1, 2, 3]
}

# Test 6: ensure_array - Scalar to Array
test_ensure_array_with_scalar if {
	input_scalar := "value"
	result := shared.ensure_array(input_scalar)
	result == ["value"]
}

# Test 7: value_in_array - Exists
test_value_in_array_exists if {
	array := [1, 2, 3]
	value := 2
	shared.value_in_array(array, value)
}

# Test 8: value_in_array - Not Exists
test_value_in_array_not_exists if {
	array := [1, 2, 3]
	value := 4
	not shared.value_in_array(array, value)
}

# Test 9: get_target_list - Wildcard Extraction
test_get_target_list_wildcard_extraction if {
	mock_resource := {
		"values": {
			"project_id": "projects/test-project/locations/us-east1",
		},
	}
	attribute_path := ["project_id"]
	target := "projects/*/locations/*"
	result := shared.get_target_list(mock_resource, attribute_path, target)
	result == ["test-project", "us-east1"]
}

# Test 10: final_formatter - Pattern Highlighting
test_final_formatter_highlight if {
	target := "projects/test-project/locations/us"
	sub_pattern := "test-project"
	result := shared.final_formatter(target, sub_pattern)
	result == "projects/'test-project'/locations/us"
}

# ==============================================================================
# INTEGRATION TEST (1): Deep Nesting (Realistic Mock)
# ==============================================================================
# ============================================================================
# MOCK DATA PROVENANCE
# ============================================================================
# Source: tests/_helpers/fixtures/real_terraform_plans/gcp_access_level_plan.json
# Extracted: 2025-12-02
# Terraform: v1.12.2
# Provider: google (from plan file)
#
# Fields used in this mock: basic, basic.conditions, basic.conditions.device_policy
#   Testing: Deep nested path access (5 levels)
#
# Fields intentionally omitted: custom, description, timeouts, title
#   Reason: Not needed for nested attribute access testing
#
# Validation: See mock_validator_test.rego
# ============================================================================

# Test 11: Deep nesting with realistic mock
test_shared_utilities_with_deep_nesting if {
	# Realistic mock with 5 levels of nesting from real Terraform plan
	mock_resource := {
		"type": "google_access_context_manager_access_level",
		"values": {
			"basic": [{
				"conditions": [{
					"device_policy": [{
						"require_screen_lock": true,
						"os_constraints": [{"os_type": "DESKTOP_CHROME_OS"}],
					}],
					"regions": ["US", "EU"],
				}],
			}],
		},
	}

	# Test get_attribute_value with deep path
	screen_lock := shared.get_attribute_value(
		mock_resource,
		["basic", 0, "conditions", 0, "device_policy", 0, "require_screen_lock"],
	)
	screen_lock == true

	# Test format_attribute_path with complex array indices
	formatted_path := shared.format_attribute_path([
		"basic",
		0,
		"conditions",
		0,
		"device_policy",
		0,
		"require_screen_lock",
	])
	formatted_path == "basic.[0].conditions.[0].device_policy.[0].require_screen_lock"

	# Test ensure_array with nested array attribute
	regions := shared.get_attribute_value(mock_resource, ["basic", 0, "conditions", 0, "regions"])
	ensured_regions := shared.ensure_array(regions)
	ensured_regions == ["US", "EU"]
}

# ==============================================================================
# ARRAY-OF-OBJECTS FIELD EXTRACTION (1): Test new enhancement
# ==============================================================================

# Test 12: Array-of-objects field extraction (new enhancement)
test_get_attribute_value_array_of_objects_extraction if {
	# Mock resource with array of objects (realistic os_constraints pattern)
	mock_resource := {
		"type": "google_access_context_manager_access_level",
		"values": {
			"basic": [{
				"conditions": [{
					"device_policy": [{
						"os_constraints": [
							{"os_type": "ANDROID", "minimum_version": "10"},
							{"os_type": "IOS", "minimum_version": "14"},
							{"os_type": "OS_UNSPECIFIED", "minimum_version": null},
						],
					}],
				}],
			}],
		},
	}

	# Test: Extract os_type field from array of objects
	os_types := shared.get_attribute_value(
		mock_resource,
		["basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", "os_type"],
	)
	
	# Should return array of extracted field values
	trace(sprintf("Extracted os_types: %v", [os_types]))
	is_array(os_types)
	count(os_types) == 3
	os_types == ["ANDROID", "IOS", "OS_UNSPECIFIED"]

	# Test: Also works with other fields in the same array
	versions := shared.get_attribute_value(
		mock_resource,
		["basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", "minimum_version"],
	)
	trace(sprintf("Extracted versions: %v", [versions]))
	is_array(versions)
	count(versions) == 2  # null values are filtered out
	versions == ["10", "14"]
}

# Test 13: Array-of-objects extraction edge cases
test_get_attribute_value_array_of_objects_edge_cases if {
	mock_resource := {
		"type": "test_resource",
		"values": {
			"empty_array": [],
			"scalar_value": "not-an-array",
			"array_of_scalars": ["a", "b", "c"],
			"nested": [{
				"items": [
					{"field": "value1"},
					{"field": "value2"},
					{"different": "ignored"},  # Missing 'field' key
				],
			}],
		},
	}

	# Empty array should return null (fallback to object.get)
	empty_result := shared.get_attribute_value(mock_resource, ["empty_array", "field"])
	empty_result == null

	# Scalar value with field access should return null
	scalar_result := shared.get_attribute_value(mock_resource, ["scalar_value", "field"])
	scalar_result == null

	# Array of scalars (not objects) should return null
	scalar_array_result := shared.get_attribute_value(mock_resource, ["array_of_scalars", "field"])
	scalar_array_result == null

	# Extraction from nested array with missing field in some objects
	nested_result := shared.get_attribute_value(mock_resource, ["nested", 0, "items", "field"])
	trace(sprintf("Nested extraction: %v", [nested_result]))
	is_array(nested_result)
	count(nested_result) == 2  # Only objects with 'field' key
	nested_result == ["value1", "value2"]
}

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================

# Test 14: Reality check with actual fixture data
test_shared_utilities_with_real_structure if {
	# Access real Terraform plan loaded by OPA from fixtures/gcp_access_level/
	# The wrapped file loads as data.gcp_access_level_plan (wrapper key becomes the path)
	real_plan_data := data.gcp_access_level_plan
	
	trace(sprintf("Assertion 1: Plan data loaded = %v", [real_plan_data != null]))
	real_plan_data != null
	
	real_resource := real_plan_data.planned_values.root_module.resources[0]
	trace(sprintf("Assertion 2: Resource exists = %v", [real_resource != null]))
	real_resource != null

	trace(sprintf("Assertion 3: Resource type = %v (expected google_access_context_manager_access_level)", [real_resource.type]))
	real_resource.type == "google_access_context_manager_access_level"

	basic_config := shared.get_resource_attribute(real_resource, "basic")
	trace(sprintf("Assertion 4: basic_config type = %v, is_array = %v", [type_name(basic_config), is_array(basic_config)]))
	is_array(basic_config)
	
	trace(sprintf("Assertion 5: basic_config count = %v", [count(basic_config)]))
	count(basic_config) > 0

	require_screen_lock := shared.get_attribute_value(
		real_resource,
		["basic", 0, "conditions", 0, "device_policy", 0, "require_screen_lock"],
	)
	trace(sprintf("Assertion 6: require_screen_lock = %v, type = %v", [require_screen_lock, type_name(require_screen_lock)]))
	require_screen_lock != null
	
	# Assertion 7: Should be boolean (validates deep path exists in real data)
	trace(sprintf("Assertion 7: require_screen_lock is_boolean = %v", [is_boolean(require_screen_lock)]))
	is_boolean(require_screen_lock)

	conditions := real_resource.values.basic[0].conditions
	trace(sprintf("Assertion 8: conditions is_array = %v, type = %v", [is_array(conditions), type_name(conditions)]))
	is_array(conditions)
}

# ==============================================================================
# TEST ASSERTION HELPERS (4): Reusable validation functions
# ==============================================================================

# Verifies violations is a set with no duplicate resource names
_assert_unique_violations(violations) if {
	is_set(violations)
	violation_names := [v.name | some v in violations]
	count(violation_names) == count({n | some n in violation_names})
}

# Verifies a single violation has the required structure
_assert_valid_violation(v) if {
	is_string(v.name)
	is_string(v.message)
	v.name != ""
	v.message != ""
}

# Test 13: Assertion helper - Unique violations
test_assert_unique_violations_pass if {
	mock_violations := {
		{"name": "resource-1", "message": "error 1"},
		{"name": "resource-2", "message": "error 2"},
	}
	_assert_unique_violations(mock_violations)
}

# Test 14: Assertion helper - Valid violation structure
test_assert_valid_violation_pass if {
	mock_violation := {"name": "test-resource", "message": "Test violation message"}
	_assert_valid_violation(mock_violation)
}

test_assert_valid_violation_fails_empty_name if {
	mock_violation := {"name": "", "message": "Test violation message"}
	not _assert_valid_violation(mock_violation)
}

test_assert_valid_violation_fails_empty_message if {
	mock_violation := {"name": "test-resource", "message": ""}
	not _assert_valid_violation(mock_violation)
}
