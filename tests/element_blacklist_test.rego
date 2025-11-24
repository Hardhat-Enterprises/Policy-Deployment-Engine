# Element Blacklist Test Suite
#
# This test suite validates the element blacklist policy type functionality,
# which detects forbidden substring patterns within array elements.
#
# Purpose:
#   Element blacklist is used to identify security issues in Terraform configurations
#   where array elements contain dangerous patterns such as:
#   - Wildcards (e.g., "*.googleapis.com")
#   - Unresolved template variables (e.g., "${var.name}")
#   - Other security-sensitive patterns
#
# Test Coverage:
#   1. _get_element_blacklist_resources() - Filters resources with violations (internal)
#   2. get_element_blacklist_violations() - Generates violation reports (public API)
#   3. _format_element_blacklist_message() - Formats error messages (internal)
#
# Test Scenarios:
#   The mock data simulates GCP Access Context Manager Service Perimeters
#   with various restricted_services configurations:
#   - Compliant: properly specified service names
#   - Wildcard: contains "*" patterns (security risk)
#   - Variable: contains unresolved "${var.*}" templates
#   - Multi-violation: contains multiple problematic patterns
#
# Usage:
#   Run tests with: opa test tests/element_blacklist_test.rego policies/gcp/_helpers/helpers.rego -v


package terraform.gcp.helpers.test

import data.terraform.gcp.helpers
import rego.v1

# Test data: Mock Terraform plan with GCP Access Context Manager Service Perimeter resources
mock_input := {
    "planned_values": {
        "root_module": {
            "resources": [
                {
                    "type": "google_access_context_manager_service_perimeter",
                    "name": "compliant-perimeter",
                    "values": {
                        "title": "compliant-perimeter",
                        "perimeter_type": "PERIMETER_TYPE_REGULAR",
                        "status": [
                            {
                                "restricted_services": [
                                    "storage.googleapis.com",
                                    "bigquery.googleapis.com"
                                ]
                            }
                        ]
                    }
                },
                {
                    "type": "google_access_context_manager_service_perimeter",
                    "name": "wildcard-perimeter",
                    "values": {
                        "title": "wildcard-perimeter",
                        "perimeter_type": "PERIMETER_TYPE_REGULAR",
                        "status": [
                            {
                                "restricted_services": [
                                    "*.googleapis.com",
                                    "storage.googleapis.com"
                                ]
                            }
                        ]
                    }
                },
                {
                    "type": "google_access_context_manager_service_perimeter",
                    "name": "variable-perimeter",
                    "values": {
                        "title": "variable-perimeter",
                        "perimeter_type": "PERIMETER_TYPE_REGULAR",
                        "status": [
                            {
                                "restricted_services": [
                                    "${var.service_name}.googleapis.com",
                                    "compute.googleapis.com"
                                ]
                            }
                        ]
                    }
                },
                {
                    "type": "google_access_context_manager_service_perimeter",
                    "name": "multi-violation-perimeter",
                    "values": {
                        "title": "multi-violation-perimeter",
                        "perimeter_type": "PERIMETER_TYPE_REGULAR",
                        "status": [
                            {
                                "restricted_services": [
                                    "*.googleapis.com",
                                    "${var.service}.googleapis.com",
                                    "pubsub.googleapis.com"
                                ]
                            }
                        ]
                    }
                },
                {
                    "type": "google_access_context_manager_access_policy",
                    "name": "different-resource-type",
                    "values": {
                        "title": "my-policy",
                        "parent": "organizations/123456789"
                    }
                }
            ]
        }
    }
}


# Tests for _get_element_blacklist_resources()
####################################################

# Single pattern matches correct resources
test_single_pattern_match if {
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*"]
    ) with input as mock_input
    
    expected_violators := {"wildcard-perimeter", "multi-violation-perimeter"}
    resource_names := {r.name | r := resources[_]}
    resource_names == expected_violators
}

# Multiple patterns match if any (OR logic) pattern found
test_multi_pattern_match if {
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*", "$"]
    ) with input as mock_input
    
    expected_violators := {"wildcard-perimeter", "variable-perimeter", "multi-violation-perimeter"}
    resource_names := {r.name | r := resources[_]}
    resource_names == expected_violators
}

# Non-matching pattern returns empty set
test_non_matching_pattern if {
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["forbidden-pattern"]
    ) with input as mock_input
    
    resources == []
}

# Only matches specified resource type
test_resource_type_filter if {
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*"]
    ) with input as mock_input
    
    count(resources) > 0
    every r in resources {
        r.type == "google_access_context_manager_service_perimeter"
    }
}

# Handles missing attribute paths gracefully
test_missing_attribute_path if {
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["nonexistent", 0, "field"],
        ["*"]
    ) with input as mock_input
    
    resources == []
}


# Tests for get_element_blacklist_violations()
####################################################

# Violations have required structure (name and message)
test_violation_structure if {
    violations := helpers.get_element_blacklist_violations(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*"],
        "service_perimeter",
        "title"
    ) with input as mock_input
    
    count(violations) > 0
    every v in violations {
        v.name != null
        v.message != null
        is_string(v.name)
        is_string(v.message)
    }
}

# Violations API identifies correct resources
test_violation_api_correct_resources if {
    violations := helpers.get_element_blacklist_violations(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*"],
        "service_perimeter",
        "title"
    ) with input as mock_input
    
    expected_violators := {"wildcard-perimeter", "multi-violation-perimeter"}
    violation_names := {v.name | v := violations[_]}
    violation_names == expected_violators
}

# Violation messages include all matched patterns
test_message_includes_all_patterns if {
    violations := helpers.get_element_blacklist_violations(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*", "${"],
        "service_perimeter",
        "title"
    ) with input as mock_input
    
    some v in violations
    v.name == "multi-violation-perimeter"
    contains(v.message, "*")
    contains(v.message, "${")
}

# No violations when pattern doesn't match
test_no_violations_empty if {
    violations := helpers.get_element_blacklist_violations(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["nonexistent"],
        "service_perimeter",
        "title"
    ) with input as mock_input
    
    violations == []
}

# Tests for _format_element_blacklist_message()
####################################################

# Message includes resource type, name, path, elements, and patterns
test_complete_message_format if {
    msg := helpers._format_element_blacklist_message(
        "service_perimeter",
        "wildcard-perimeter",
        "status.[0].restricted_services",
        ["*.googleapis.com", "*.google.com"],
        ["*"]
    )
    
    contains(msg, "service_perimeter")
    contains(msg, "wildcard-perimeter")
    contains(msg, "status.[0].restricted_services")
    contains(msg, "*.googleapis.com")
    contains(msg, "*.google.com")
    contains(msg, "[\"*\"]")
}

# Message follows expected sentence structure
test_message_structure if {
    msg := helpers._format_element_blacklist_message(
        "Resource Type",
        "resource-name",
        "attribute.path",
        ["violating-element"],
        ["pattern"]
    )
    
    contains(msg, "Resource Type 'resource-name'")
    contains(msg, "has 'attribute.path'")
    contains(msg, "containing blacklisted patterns")
    contains(msg, "in elements:")
}


# Integration tests
####################################################

# Wildcard detection across full pipeline
test_end_to_end_integration if {
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*"]
    ) with input as mock_input
    
    violations := helpers.get_element_blacklist_violations(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        ["*"],
        "service_perimeter",
        "title"
    ) with input as mock_input
    
    expected_violators := {"wildcard-perimeter", "multi-violation-perimeter"}
    
    # Verify resource detection
    resource_names := {r.name | r := resources[_]}
    resource_names == expected_violators
    
    # Verify violation generation
    violation_names := {v.name | v := violations[_]}
    violation_names == expected_violators
    
    # Verify resources and violations are consistent
    resource_names == violation_names
    
    # Verify all violations have non-empty messages
    every v in violations {
        v.message != ""
        is_string(v.message)
    }
}

# Multiple pattern OR logic across resource types
test_multi_pattern_or_logic if {
    security_patterns := ["*", "${", "var."]
    
    resources := helpers._get_element_blacklist_resources(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        security_patterns
    ) with input as mock_input
    
    violations := helpers.get_element_blacklist_violations(
        "google_access_context_manager_service_perimeter",
        ["status", 0, "restricted_services"],
        security_patterns,
        "service_perimeter",
        "title"
    ) with input as mock_input
    
    expected_violators := {"wildcard-perimeter", "variable-perimeter", "multi-violation-perimeter"}
    
    # Verify resource detection
    resource_names := {r.name | r := resources[_]}
    resource_names == expected_violators
    
    # Verify violation generation
    violation_names := {v.name | v := violations[_]}
    violation_names == expected_violators
    
    # Verify consistency between resources and violations
    resource_names == violation_names
    
    # Verify all violations have messages
    every v in violations {
        v.message != ""
        is_string(v.message)
    }
}
