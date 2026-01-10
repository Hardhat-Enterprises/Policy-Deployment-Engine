package terraform.helpers.policies.whitelist_test

# Whitelist Policy Test Suite
#
# Tests the whitelist policy module which detects resources with non-allowed values.
# Covers scalar values, array AND logic (all must be whitelisted), and message formatting.

import data.terraform.helpers.policies.whitelist
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test _is_whitelisted helper function
# ==============================================================================

# Test 1: Scalar value in whitelist (boundary: match)
test_is_whitelisted_scalar_match if {
	whitelist._is_whitelisted(["allowed", "permitted"], "allowed")
}

# Test 2: Scalar value not in whitelist (boundary: no match)
test_is_whitelisted_scalar_no_match if {
	not whitelist._is_whitelisted(["allowed", "permitted"], "forbidden")
}

# Test 3: Array with ALL whitelisted values (AND logic proof)
test_is_whitelisted_array_all_match if {
	whitelist._is_whitelisted(["good", "better", "best"], ["good", "best"])
}

# Test 4: Array with SOME non-whitelisted values (AND logic negative)
test_is_whitelisted_array_partial_match if {
	not whitelist._is_whitelisted(["good", "better"], ["good", "bad"])
}

# Test 5: Empty array whitelisting (edge case)
test_is_whitelisted_empty_array if {
	whitelist._is_whitelisted(["allowed"], [])
}

# ==============================================================================
# MOCK DATA PROVENANCE
# ==============================================================================
# Minimal mocks in tests 6-10 are synthetic, designed to test specific logic paths.
# They represent simplified versions of real Terraform resources with controlled
# attributes to validate exact behavior (e.g., AND logic, edge cases).
#
# Reality check (test 8) uses: tests/_helpers/fixtures/gcp_storage_bucket/plan.json
# Source: inputs/gcp/cloud_storage/google_storage_bucket/retention_period/
# Purpose: Tests against actual Terraform plan structure (see blacklist_test.rego)
# ==============================================================================

# Test 6: get_violations with minimal mock (happy path + structure validation)
test_get_violations_minimal if {
	# Minimal mock with non-whitelisted location
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "test-bucket",
							"location": "ASIA",
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

	violations := whitelist.get_violations(
		tf_variables,
		["location"],
		["US", "EU"],
	) with input as mock_input

	count(violations) == 1
	some v in violations
	v.name == "test-bucket"
	shared_test._assert_valid_violation(v)
	contains(v.message, "test-bucket")      # Resource name
	contains(v.message, "ASIA")             # Violating value
	contains(v.message, "should be set to") # Verdict
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
					# Resource with non-whitelisted value
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "violating-bucket",
							"location": "ASIA",
							"storage_class": "STANDARD",
						},
					},
					# Resource with whitelisted value
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"location": "US",
							"storage_class": "STANDARD",
						},
					},
					# Resource with null location (edge case - should violate)
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
							"location": "ASIA",
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

	violations := whitelist.get_violations(
		tf_variables,
		["location"],
		["US", "EU"],
	) with input as mock_input

	# Should flag violating-bucket and null-bucket
	count(violations) == 2
	violation_names := {v.name | some v in violations}
	violation_names == {"violating-bucket", "null-bucket"}

	# Verify message format
	some v in violations
	v.name == "violating-bucket"
	contains(v.message, "Storage Bucket")
	contains(v.message, "location")
	contains(v.message, "should be set to")
}

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================

# Test 8: get_violations with real Terraform plan
test_get_violations_with_real_terraform_plan if {
	# Use real fixture - gcp_storage_bucket from fixtures
	tf_variables := {
		"resource_type": "google_storage_bucket",
		"friendly_resource_name": "Storage Bucket",
		"resource_value_name": "name",
	}

	# Test with real data - whitelist specific locations
	violations := whitelist.get_violations(
		tf_variables,
		["location"],
		["US-CENTRAL1", "US-EAST1"],
	) with input as data.gcp_storage_bucket_plan

	is_set(violations)
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Storage Bucket")
		contains(v.message, "location")
		contains(v.message, "should be set to")
	}
}

# Test 11: Utilize fixture attribute - storage_class whitelist
test_storage_class_fixture if {
	# Test using actual storage_class attribute from gcp_storage_bucket_plan
	# Fixture has storage_class: "STANDARD" for both buckets
	tf_variables := {
		"resource_type": "google_storage_bucket",
		"friendly_resource_name": "Storage Bucket",
		"resource_value_name": "name",
	}

	# Whitelist only NEARLINE and COLDLINE (both buckets should violate)
	violations := whitelist.get_violations(
		tf_variables,
		["storage_class"],
		["NEARLINE", "COLDLINE"],
	) with input as data.gcp_storage_bucket_plan

	# Both c123 and nc123 have non-whitelisted storage_class: "STANDARD"
	count(violations) == 2
	violation_names := {v.name | some v in violations}
	violation_names == {"c123", "nc123"}

	every v in violations {
		contains(v.message, "storage_class")
		contains(v.message, "STANDARD")
		contains(v.message, "should be set to")
	}
}

# ==============================================================================
# ADDITIONAL TESTS (2): Real-world usage patterns
# ==============================================================================

# Test 9: Boolean whitelisting (real-world use case - versioning enabled)
test_get_violations_boolean_whitelist if {
	# Mock matching real policy: versioning.enabled must be true
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"versioning": [
								{
									"enabled": true,
								},
							],
							"location": "US",
						},
					},
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "non-compliant-bucket",
							"versioning": [
								{
									"enabled": false,
								},
							],
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

	# Whitelist versioning.enabled: true (actual policy usage pattern)
	violations := whitelist.get_violations(
		tf_variables,
		["versioning", 0, "enabled"],
		[true],
	) with input as mock_input

	# Should only flag non-compliant-bucket
	count(violations) == 1
	some v in violations
	v.name == "non-compliant-bucket"
	contains(v.message, "versioning")
	contains(v.message, "false")
	contains(v.message, "should be set to")
}

# Test 10: Array attribute with AND logic (all elements must be whitelisted)
test_get_violations_array_attribute_and_logic if {
	# Mock with array attributes testing AND logic
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "compliant-bucket",
							"cors": [
								{
									"method": ["GET", "POST"],
									"origin": ["https://example.com"],
								},
							],
						},
					},
					{
						"type": "google_storage_bucket",
						"values": {
							"name": "violating-bucket",
							"cors": [
								{
									"method": ["GET", "DELETE"],
									"origin": ["https://example.com"],
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

	# Whitelist only safe HTTP methods (AND logic: ALL must be in whitelist)
	violations := whitelist.get_violations(
		tf_variables,
		["cors", 0, "method"],
		["GET", "POST", "HEAD"],
	) with input as mock_input

	# Should flag bucket with DELETE (not in whitelist)
	count(violations) == 1
	some v in violations
	v.name == "violating-bucket"
	contains(v.message, "cors")
	contains(v.message, "method")
}
