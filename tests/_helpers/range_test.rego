package terraform.helpers.policies.range_test

# Range Policy Test Suite
#
# Tests the range policy module which validates numeric attributes fall within bounds.
# Covers boundary values and numeric edge cases. Both bounds are required.

import data.terraform.helpers.policies.range
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test _test_value_range helper function
# ==============================================================================

# Test 1: Value within range (happy path)
test_value_range_within if {
	range._test_value_range(50, 10, 100)
}

# Test 2: Value below range (boundary: below)
test_value_range_below if {
	not range._test_value_range(5, 10, 100)
}

# Test 3: Value above range (boundary: above)
test_value_range_above if {
	not range._test_value_range(150, 10, 100)
}

# Test 4: Value at lower boundary (boundary: exact min)
test_value_range_lower_boundary if {
	range._test_value_range(10, 10, 100)
}

# Test 5: Value at upper boundary (boundary: exact max)
test_value_range_upper_boundary if {
	range._test_value_range(100, 10, 100)
}

# ==============================================================================
# MOCK DATA PROVENANCE
# ==============================================================================
# Minimal mocks in tests 6-7 are synthetic, designed to test specific logic paths.
# They represent simplified versions of real Terraform resources with controlled
# numeric values to validate boundary conditions.
#
# Reality check (test 8) uses: tests/_helpers/fixtures/gcp_storage_bucket/plan.json
# Source: inputs/gcp/cloud_storage/google_storage_bucket/retention_period/
# Purpose: Tests numeric range validation on actual retention_period values:
#   - c123: retention_period=604800 (7 days in seconds)
#   - nc123: retention_period=2692000 (31 days in seconds)
# ==============================================================================

# Test 6: get_violations with minimal mock (violation + compliant)
test_get_violations_minimal if {
	# Mock with resources in and out of range
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"retention_policy": [
								{
									"retention_period": 90,
								},
							],
						},
					},
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "violating-bucket",
							"retention_policy": [
								{
									"retention_period": 400,
								},
							],
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_storage_bucket",
		"friendly_resource_name": "Storage Bucket",
		"resource_value_name": "name",
	}

	# Range: [30, 365] days
	violations := range.get_violations(
		tf_variables,
		["retention_policy", 0, "retention_period"],
		[30, 365],
	) with input as mock_input

	count(violations) == 1
	some v in violations
	v.name == "violating-bucket"
	shared_test._assert_valid_violation(v)
	contains(v.message, "violating-bucket") # Resource name
	contains(v.message, "400")              # Violating value
	contains(v.message, "must be between")  # Verdict
}

# ==============================================================================
# INTEGRATION TEST (1): Numeric edge cases
# ==============================================================================

# Test 7: get_violations with realistic numeric edge cases
test_get_violations_realistic if {
	# Realistic mock with various numeric edge cases
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Resource with value in range
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"lifecycle_rule": [
								{
									"action": [{"type": "Delete"}],
									"condition": [{"age": 30}],
								},
							],
						},
					},
					# Resource with value below range
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "below-bucket",
							"lifecycle_rule": [
								{
									"action": [{"type": "Delete"}],
									"condition": [{"age": -10}],
								},
							],
						},
					},
					# Resource with large value (out of range)
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "large-bucket",
							"lifecycle_rule": [
								{
									"action": [{"type": "Delete"}],
									"condition": [{"age": 10000}],
								},
							],
						},
					},
					# Different resource type (should be ignored)
					{
						"type": "google_project",
						"values": {
							"name": "test-project",
							"lifecycle_rule": [
								{
									"action": [{"type": "Delete"}],
									"condition": [{"age": 5000}],
								},
							],
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_storage_bucket",
		"friendly_resource_name": "Storage Bucket",
		"resource_value_name": "name",
	}

	# Range: [0, 365] - zero is inclusive, negatives and large values violate
	violations := range.get_violations(
		tf_variables,
		["lifecycle_rule", 0, "condition", 0, "age"],
		[0, 365],
	) with input as mock_input

	# Should flag below-bucket and large-bucket
	count(violations) == 2
	violation_names := {v.name | some v in violations}
	violation_names == {"below-bucket", "large-bucket"}

	# Verify messages include range information
	every v in violations {
		contains(v.message, "must be between")
		contains(v.message, "0")
		contains(v.message, "365")
	}
}

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================

# Test 8: get_violations with real Terraform plan
test_real_plan_violations if {
	# Use real fixture - gcp_storage_bucket from fixtures
	tf_variables := {
		"resource_type": "google_storage_bucket",
		"friendly_resource_name": "Storage Bucket",
		"resource_value_name": "name",
	}

	# Test with real data - check retention_period attribute
	# Range: 604800 to 2592000 seconds (7 to 30 days)
	violations := range.get_violations(
		tf_variables,
		["retention_policy", 0, "retention_period"],
		[604800, 2592000],  # 7 days to 30 days in seconds
	) with input as data.gcp_storage_bucket_plan

	# Verify no crashes and proper structure
	is_set(violations)
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Storage Bucket")
		contains(v.message, "must be between")
	}
}
