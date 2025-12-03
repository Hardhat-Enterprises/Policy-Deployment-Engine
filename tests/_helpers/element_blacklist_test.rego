package terraform.helpers.policies.element_blacklist_test

# Element Blacklist Policy Test Suite
#
# Tests the element blacklist policy module which detects array elements containing
# forbidden substring patterns (e.g., wildcards "*" or template variables "${var.*}").

import data.terraform.helpers.policies.element_blacklist
import data.terraform.helpers.shared
import data.terraform.helpers.shared_test
import rego.v1

# ==============================================================================
# UNIT TESTS (6): Test _get_resources and get_violations with simple mocks
# ==============================================================================

# Test 1: Single pattern match (wildcard detection)
test_get_resources_single_pattern if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "wildcard-perimeter",
						"values": {
							"title": "wildcard-perimeter",
							"status": [{
								"restricted_services": [
									"*.googleapis.com",
									"storage.googleapis.com",
								],
							}],
						},
					},
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "compliant-perimeter",
						"values": {
							"title": "compliant-perimeter",
							"status": [{
								"restricted_services": [
									"storage.googleapis.com",
									"bigquery.googleapis.com",
								],
							}],
						},
					},
				],
			},
		},
	}

	resources := element_blacklist._get_resources(
		"google_access_context_manager_service_perimeter",
		["status", 0, "restricted_services"],
		["*"],
	) with input as mock_input

	# Only wildcard-perimeter should match
	count(resources) == 1
	some r in resources
	r.name == "wildcard-perimeter"
}

# Test 2: Multiple patterns with OR logic
test_get_resources_multi_pattern_or_logic if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "wildcard-perimeter",
						"values": {
							"title": "wildcard-perimeter",
							"status": [{
								"restricted_services": ["*.googleapis.com"],
							}],
						},
					},
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "variable-perimeter",
						"values": {
							"title": "variable-perimeter",
							"status": [{
								"restricted_services": ["${var.service}.googleapis.com"],
							}],
						},
					},
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "compliant-perimeter",
						"values": {
							"title": "compliant-perimeter",
							"status": [{
								"restricted_services": ["storage.googleapis.com"],
							}],
						},
					},
				],
			},
		},
	}

	resources := element_blacklist._get_resources(
		"google_access_context_manager_service_perimeter",
		["status", 0, "restricted_services"],
		["*", "${"],
	) with input as mock_input

	# Both wildcard and variable perimeters should match (OR logic)
	count(resources) == 2
	resource_names := {r.name | some r in resources}
	resource_names == {"wildcard-perimeter", "variable-perimeter"}
}

# Test 3: Non-matching pattern returns empty set
test_get_resources_no_match if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "compliant-perimeter",
						"values": {
							"title": "compliant-perimeter",
							"status": [{
								"restricted_services": ["storage.googleapis.com"],
							}],
						},
					},
				],
			},
		},
	}

	resources := element_blacklist._get_resources(
		"google_access_context_manager_service_perimeter",
		["status", 0, "restricted_services"],
		["forbidden-pattern"],
	) with input as mock_input

	count(resources) == 0
}

# Test 4: Resource type filter (only matches specified type)
test_get_resources_resource_type_filter if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "wildcard-perimeter",
						"values": {
							"title": "wildcard-perimeter",
							"status": [{
								"restricted_services": ["*.googleapis.com"],
							}],
						},
					},
					{
						"type": "google_access_context_manager_access_policy",
						"name": "different-type",
						"values": {
							"title": "my-policy",
							"services": ["*.googleapis.com"],
						},
					},
				],
			},
		},
	}

	resources := element_blacklist._get_resources(
		"google_access_context_manager_service_perimeter",
		["status", 0, "restricted_services"],
		["*"],
	) with input as mock_input

	# Only service_perimeter type should match
	count(resources) == 1
	some r in resources
	r.type == "google_access_context_manager_service_perimeter"
}

# Test 5: Missing attribute path returns empty set
test_get_resources_missing_attribute if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "perimeter",
						"values": {
							"title": "perimeter",
						},
					},
				],
			},
		},
	}

	resources := element_blacklist._get_resources(
		"google_access_context_manager_service_perimeter",
		["nonexistent", 0, "field"],
		["*"],
	) with input as mock_input

	count(resources) == 0
}

# Test 6: get_violations minimal mock (structure validation)
test_get_violations_minimal if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "wildcard-perimeter",
						"values": {
							"title": "wildcard-perimeter",
							"status": [{
								"restricted_services": ["*.googleapis.com"],
							}],
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_access_context_manager_service_perimeter",
		"friendly_resource_name": "Service Perimeter",
		"resource_value_name": "title",
	}

	violations := element_blacklist.get_violations(
		tf_variables,
		["status", 0, "restricted_services"],
		["*"],
	) with input as mock_input

	count(violations) == 1
	some v in violations
	v.name == "wildcard-perimeter"
	shared_test._assert_valid_violation(v)
	contains(v.message, "wildcard-perimeter")  # Resource name
	contains(v.message, "*.googleapis.com")    # Violating element
	contains(v.message, "[\"*\"]")            # Pattern matched
}

# ==============================================================================
# INTEGRATION TEST (1): Realistic structure with edge cases
# ==============================================================================

# Test 7: get_violations with realistic multi-resource scenario
test_get_violations_realistic if {
	mock_input := {
		"planned_values": {
			"root_module": {
				"resources": [
					# Wildcard violation
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "wildcard-perimeter",
						"values": {
							"title": "wildcard-perimeter",
							"status": [{
								"restricted_services": [
									"*.googleapis.com",
									"storage.googleapis.com",
								],
							}],
						},
					},
					# Variable template violation
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "variable-perimeter",
						"values": {
							"title": "variable-perimeter",
							"status": [{
								"restricted_services": [
									"${var.service}.googleapis.com",
									"compute.googleapis.com",
								],
							}],
						},
					},
					# Multiple violations in one resource
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "multi-violation-perimeter",
						"values": {
							"title": "multi-violation-perimeter",
							"status": [{
								"restricted_services": [
									"*.googleapis.com",
									"${var.service}.googleapis.com",
									"pubsub.googleapis.com",
								],
							}],
						},
					},
					# Compliant resource
					{
						"type": "google_access_context_manager_service_perimeter",
						"name": "compliant-perimeter",
						"values": {
							"title": "compliant-perimeter",
							"status": [{
								"restricted_services": [
									"storage.googleapis.com",
									"bigquery.googleapis.com",
								],
							}],
						},
					},
					# Different resource type (should be ignored)
					{
						"type": "google_access_context_manager_access_policy",
						"name": "different-type",
						"values": {
							"title": "my-policy",
							"parent": "organizations/123456789",
						},
					},
				],
			},
		},
	}

	tf_variables := {
		"resource_type": "google_access_context_manager_service_perimeter",
		"friendly_resource_name": "Service Perimeter",
		"resource_value_name": "title",
	}

	violations := element_blacklist.get_violations(
		tf_variables,
		["status", 0, "restricted_services"],
		["*", "${"],
	) with input as mock_input

	# Should detect all three violating perimeters
	count(violations) == 3
	violation_names := {v.name | some v in violations}
	violation_names == {"wildcard-perimeter", "variable-perimeter", "multi-violation-perimeter"}

	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Service Perimeter")
		contains(v.message, "status.[0].restricted_services")
	}

	# Verify multi-violation includes both patterns
	some v in violations
	v.name == "multi-violation-perimeter"
	contains(v.message, "*")
	contains(v.message, "${")
}

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================

# ==============================================================================
# REALITY CHECK (1): Test with real Terraform plan structure
# ==============================================================================
# ============================================================================
# FIXTURE PROVENANCE
# ============================================================================
# Source: inputs/gcp/access_context_manager_vpc_service_controls/
#         access_context_manager_access_level/device_policy/
# Fixture: tests/_helpers/fixtures/gcp_access_level/plan.json
# Why this fixture: Contains actual array data (regions: ["CH", "IT", "US"])
#                   for testing element blacklist on string arrays
# Alternative: gcp_storage_bucket has empty arrays (cors: [], lifecycle_rule: [])
# ============================================================================

# Test 8: get_violations with real Terraform plan (access level fixture)
test_real_plan_violations if {
	# Use real fixture with actual array data from access level regions
	tf_variables := {
		"resource_type": "google_access_context_manager_access_level",
		"friendly_resource_name": "Access Level",
		"resource_value_name": "title",
	}

	# Test regions array for any restricted regions
	# Fixture has regions: ["CH", "IT", "US"] in nc resource
	violations := element_blacklist.get_violations(
		tf_variables,
		["basic", 0, "conditions", 0, "regions"],
		["US", "CN", "RU"],  # Blacklist certain countries
	) with input as data.gcp_access_level_plan

	is_set(violations)
	every v in violations {
		shared_test._assert_valid_violation(v)
		contains(v.message, "Access Level")
		contains(v.message, "basic")
		contains(v.message, "regions")
	}
}
