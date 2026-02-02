package terraform.helpers.policies.pattern_blacklist

# Pattern Blacklist Policy
#
# Detects resources where wildcard-extracted substrings match blacklisted patterns.
# Uses target pattern with * wildcards to extract substrings, then checks each
# against position-specific blacklists.
#
# Example:
#   target: "projects/*/locations/*"
#   patterns: [["test-project"], ["us-east1", "europe-west1"]]
#   Matches if project is "test-project" OR location is blacklisted region

import data.terraform.helpers.shared

# Identifies resources matching pattern blacklist constraints
#
# Parameters:
#   tf_variables - Resource metadata
#   attribute_path - Path to attribute for pattern matching
#   values_formatted - [target_pattern, patterns_array] where:
#                      - target_pattern: String with * wildcards
#                      - patterns_array: Array of arrays (one per wildcard position)
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, values_formatted) = results if {
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, values_formatted)
    results := {
        _build_violation(tf_variables, attribute_path, values_formatted, resource) |
        some resource in nc_resources
    }
}

_build_violation(tf_variables, attribute_path, values_formatted, resource) = violation if {
    attribute_path_string := shared.format_attribute_path(attribute_path)
    nc := _get_blacklist(resource, attribute_path, values_formatted[0], values_formatted[1])
    
    violation := {
        "name": shared.get_resource_attribute(resource, tf_variables.resource_value_name),
        "message": _format_message(
            tf_variables.friendly_resource_name,
            shared.get_resource_attribute(resource, tf_variables.resource_value_name),
            attribute_path_string,
            shared.get_attribute_value(resource, attribute_path),
            nc
        )
    }
}

# Check if a value matches blacklist patterns
_matches_blacklist(patterns, value) if {
    shared.value_in_array(patterns, value)
}

_get_blacklist(resource, attribute_path, target, patterns) = ncc if {
    target_list = shared.get_target_list(resource, attribute_path, target) # list of targetted substrings
    ncc := [
        {"value": target_list[i], "allowed": patterns[i]} |
            some i
            _matches_blacklist(patterns[i], target_list[i]) # direct mapping of positions of target * with its list of allowed patterns
    ]
}

_get_resources(resource_type, attribute_path, values) = resources if {
    resources := {
        resource |
        target := values[0] # target val string
        patterns := values[1] # allowed patterns (list)
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        count(_get_blacklist(resource, attribute_path, target, patterns)) > 0 # ok, there is a resource with at least one non-compliant
    }
}

_format_message(friendly_resource_name, resource_value_name, attribute_path_string, full_value, nc_list) = msg if {
    count(nc_list) == 1
    this_nc := nc_list[0]
    formatted_value := shared.final_formatter(full_value, this_nc.value)
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'%s. This is blacklisted: %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, formatted_value, shared.empty_message(this_nc.value), this_nc.allowed]
    )
} else = msg if {
    count(nc_list) > 1
    failures := concat(", ", [sprintf("position %d '%s' (blacklisted: %v)", [i, nc.value, nc.allowed]) | some i, nc in nc_list])
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'. Multiple positions matched blacklist: %s",
        [friendly_resource_name, resource_value_name, attribute_path_string, full_value, failures]
    )
}