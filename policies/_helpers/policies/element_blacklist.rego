package terraform.helpers.policies.element_blacklist

# Element Blacklist Policy
#
# Detects array attributes containing elements with blacklisted substrings.
# Uses simple substring matching (contains) rather than regex patterns.
#
# Example:
#   patterns: ["test", "staging"]
#   Violates if any array element contains "test" or "staging"

import data.terraform.helpers.shared

# Identifies resources with array elements containing blacklisted substrings
#
# Parameters:
#   tf_variables - Resource metadata
#   attribute_path - Path to array attribute
#   patterns - Array of substring patterns to match against
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, patterns) = results if {
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, patterns)
    results := {
        _build_violation(tf_variables, attribute_path, patterns, resource) |
        some resource in nc_resources
    }
}

_build_violation(tf_variables, attribute_path, patterns, resource) = violation if {
    attribute_path_string := shared.format_attribute_path(attribute_path)
    array_value := shared.get_attribute_value(resource, attribute_path)
    violating_elements := [elem | 
        elem := array_value[_]
        some pattern in patterns
        contains(elem, pattern)
    ]
    
    violation := {
        "name": shared.get_resource_attribute(resource, tf_variables.resource_value_name),
        "message": _format_message(
            tf_variables.friendly_resource_name, 
            shared.get_resource_attribute(resource, tf_variables.resource_value_name), 
            attribute_path_string, 
            violating_elements, 
            patterns
        )
    }
}


# get_resources() filters Terraform resources based on array element content violations.
#
# Parameters:
#   resource_type   - Terraform resource type (e.g., "google_access_context_manager_service_perimeter")
#   attribute_path  - Array path to target array attribute (e.g., ["status", 0, "restricted_services"])
#   patterns        - Array of forbidden substrings (e.g., ["*", "0.0.0.0"])
#
# Returns:
#   An array of resources that violate the policy by having at least one array element
#   containing at least one of the blacklisted patterns. Returns empty array if no violations found.
#
# Example:
#   For a resource with restricted_services = ["*.googleapis.com", "storage.googleapis.com"]
#   and patterns = ["*"], this function returns the resource because "*.googleapis.com" contains "*"
_get_resources(resource_type, attribute_path, patterns) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        array_value := shared.get_attribute_value(resource, attribute_path)
        is_array(array_value)
        # Check if ANY element contains ANY pattern - collect matches
        matches := [1 | 
            some element in array_value
            some pattern in patterns
            contains(element, pattern)
        ]
        count(matches) > 0
    }
}


# format_message() generates a human-readable error message for element blacklist violations.
#
# Parameters:
#   friendly_resource_name  - Human-readable resource type (e.g., "Service Perimeter", "Storage Bucket")
#   resource_value_name     - Specific resource identifier (e.g., "my-service-perimeter")
#   attribute_path_string   - Path to violating attribute (e.g., "status.[0].restricted_services")
#   violating_elements      - Array containing blacklisted patterns (e.g., ["*.googleapis.com"])
#   patterns                - Array of forbidden substrings (e.g., ["*", "0.0.0.0"])
#
# Returns:
#   Formatted error message for and user feedback.
#
# Message Format:
#   "{friendly_resource_name} '{resource_value_name}' has '{attribute_path_string}' containing blacklisted patterns 
#    {patterns} in elements: {violating_elements}"
#
# Example Output:
#   "Service Perimeter 'my-perimeter' has 'status.[0].restricted_services' containing blacklisted patterns [\"*\"] in 
#   elements: [\"*.googleapis.com\"]"
_format_message(friendly_resource_name, resource_value_name, attribute_path_string, violating_elements, patterns) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' containing blacklisted patterns %v in elements: %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, patterns, violating_elements]
    )
}
