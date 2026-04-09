package terraform.helpers.policies.blacklist

# Blacklist Policy
#
# Detects resources with attributes matching forbidden values.
# Supports both scalar values and arrays with OR logic (any match = violation).
#
# Special case: Empty array [] can be blacklisted explicitly.

import data.terraform.helpers.shared

# Identifies resources violating blacklist constraints
#
# Parameters:
#   tf_variables - Resource metadata (resource_type, friendly_resource_name, value_name)
#   attribute_path - Path to attribute being evaluated (array or string)
#   blacklisted_values - Array of forbidden values
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, blacklisted_values) = results if {
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, blacklisted_values)
    results := {
        _build_violation(tf_variables, attribute_path, blacklisted_values, resource) |
        some resource in nc_resources
    }
}

_build_violation(tf_variables, attribute_path, blacklisted_values, resource) = violation if {
    attribute_path_string := shared.format_attribute_path(attribute_path)
    attribute_value := shared.get_attribute_value(resource, attribute_path)
    
    violation := {
        "name": shared.get_resource_attribute(resource, tf_variables.resource_value_name),
        "message": _format_message(
            tf_variables.friendly_resource_name,
            shared.get_resource_attribute(resource, tf_variables.resource_value_name),
            attribute_path_string,
            attribute_value,
            shared.empty_message(attribute_value),
            blacklisted_values
        )
    }
}

# Check if a value is blacklisted (handles both scalars and arrays)
_is_blacklisted(forbidden, value) if {
    # Handle empty array blacklisting specifically
    [] in forbidden
    is_array(value)
    count(value) == 0
}

_is_blacklisted(forbidden, value) if {
    # Array case: ANY intersection means violation (OR logic)
    is_array(value)
    forbidden_set := {x | some x in forbidden}
    value_set := {x | some x in value}
    count(forbidden_set & value_set) > 0
}

_is_blacklisted(forbidden, value) if {
    # Scalar case: direct membership check
    shared.value_in_array(forbidden, value)
}

_get_resources(resource_type, attribute_path, blacklisted_values) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        _is_blacklisted(blacklisted_values, shared.get_attribute_value(resource, attribute_path))
    }
}

_format_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, nc_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. This is blacklisted: %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, nc_values]
    )
}