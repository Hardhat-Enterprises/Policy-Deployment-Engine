package terraform.helpers.policies.blacklist_test

# Blacklist Policy Test Suite
#
# Tests the blacklist policy module which detects resources with forbidden values.
# Covers scalar values, array OR logic, empty array special case, and message formatting.

import data.terraform.helpers.policies.blacklist
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test _is_blacklisted helper function
# ==============================================================================

# Test 1: Scalar value in blacklist (boundary: match)
test_is_blacklisted_scalar_match if {
	blacklist._is_blacklisted(["forbidden", "banned"], "forbidden")
}

# Test 2: Scalar value not in blacklist (boundary: no match)
test_is_blacklisted_scalar_no_match if {
	not blacklist._is_blacklisted(["forbidden", "banned"], "allowed")
}

# Test 3: Array with ANY blacklisted value (OR logic proof)
test_is_blacklisted_array_any_match if {
	blacklist._is_blacklisted(["bad", "evil"], ["good", "bad", "ugly"])
}

# Test 4: Array with NO blacklisted values (OR logic negative)
test_is_blacklisted_array_no_match if {
	not blacklist._is_blacklisted(["bad", "evil"], ["good", "ugly"])
}

# Test 5: Empty array blacklisting (critical edge case)
test_is_blacklisted_empty_array if {
	blacklist._is_blacklisted([[]], [])
}

# ==============================================================================
# MOCK DATA PROVENANCE
# ==============================================================================
# Minimal mocks in tests 6-10 are synthetic, designed to test specific logic paths.
# They represent simplified versions of real Terraform resources with controlled
# attributes to validate exact behavior (e.g., single violation, edge cases).
#
# Reality check (test 8) uses: tests/_helpers/fixtures/gcp_storage_bucket/plan.json
# Source: inputs/gcp/cloud_storage/google_storage_bucket/retention_period/
# Purpose: Tests against actual Terraform plan structure with 2 buckets:
#   - c123: retention_period=604800 (7 days), location=US, force_destroy=true
#   - nc123: retention_period=2692000 (31 days), location=US, force_destroy=true
# ==============================================================================

# Test 6: get_violations with minimal mock (happy path + structure validation)
test_get_violations_minimal if {
	# Minimal mock with blacklisted location
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "test-bucket",
							"location": "US",
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

	violations := blacklist.get_violations(
		tf_variables,
		["location"],
		["US"],
	) with input as mock_input

	count(violations) == 1
	some v in violations
	v.name == "test-bucket"
	shared_test._assert_valid_violation(v)
	contains(v.message, "test-bucket")  # Resource name
	contains(v.message, "US")           # Violating value
	contains(v.message, "blacklisted")  # Verdict
}

# ==============================================================================
# INTEGRATION TEST (1): Realistic structure with edge cases
# ==============================================================================

# Test 7: get_violations with realistic Terraform structures
test_get_violations_realistic if {
	# Realistic mock including edge cases
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Normal resource with blacklisted value
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "violating-bucket",
							"location": "US",
							"storage_class": "STANDARD",
						},
					},
					# Resource with allowed value
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"location": "EU",
							"storage_class": "STANDARD",
						},
					},
					# Resource with null location (edge case)
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "null-bucket",
							"location": null,
							"storage_class": "STANDARD",
						},
					},
					# Different resource type (should be ignored)
					{
						"type": "google_project",
						"values": {
							"name": "test-project",
							"location": "US",
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

	violations := blacklist.get_violations(
		tf_variables,
		["location"],
		["US"],
	) with input as mock_input

	# Should only flag the violating bucket
	count(violations) == 1
	violation_names := {v.name | some v in violations}
	violation_names == {"violating-bucket"}

	some v in violations
	contains(v.message, "Storage Bucket")
	contains(v.message, "location")
	contains(v.message, "'US'")
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

	# Test with real data - blacklist a location that might exist
	violations := blacklist.get_violations(
		tf_variables,
		["location"],
		["US", "EU"],
	) with input as data.gcp_storage_bucket_plan

	is_set(violations)
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Storage Bucket")
		contains(v.message, "location")
	}
}

# ==============================================================================
# ADDITIONAL TESTS (2): Real-world usage patterns
# ==============================================================================

# Test 9: Boolean blacklisting (real-world use case - force_destroy)
test_get_violations_boolean_blacklist if {
	# Mock matching real policy: force_destroy: true is blacklisted
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "unsafe-bucket",
							"force_destroy": true,
							"location": "US",
						},
					},
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "safe-bucket",
							"force_destroy": false,
							"location": "US",
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

	# Blacklist force_destroy: true (actual policy usage pattern)
	violations := blacklist.get_violations(
		tf_variables,
		["force_destroy"],
		[true],
	) with input as mock_input

	# Should only flag unsafe-bucket
	count(violations) == 1
	some v in violations
	v.name == "unsafe-bucket"
	contains(v.message, "force_destroy")
	contains(v.message, "true")
}

# Test 10: Array attribute with OR logic (tests helper's array intersection)
test_get_violations_array_attribute if {
	# Mock with array attributes (e.g., labels, tags)
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "violating-bucket",
							"labels": {
								"env": "dev",
								"team": "security",
							},
							"uniform_bucket_level_access": [
								{
									"enabled": false,
									"locked": false,
								},
							],
						},
					},
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"labels": {
								"env": "prod",
								"team": "security",
							},
							"uniform_bucket_level_access": [
								{
									"enabled": true,
									"locked": true,
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

	# Blacklist specific nested array attribute values (OR logic)
	# If uniform_bucket_level_access array contains enabled: false, it violates
	violations := blacklist.get_violations(
		tf_variables,
		["uniform_bucket_level_access", 0, "enabled"],
		[false],
	) with input as mock_input

	# Should flag bucket with enabled: false
	count(violations) == 1
	some v in violations
	v.name == "violating-bucket"
	contains(v.message, "uniform_bucket_level_access")
	contains(v.message, "false")
}
