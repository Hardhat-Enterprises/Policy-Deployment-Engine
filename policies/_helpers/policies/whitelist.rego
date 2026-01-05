package terraform.helpers.policies.whitelist

# Whitelist Policy
#
# Detects resources with attributes NOT matching allowed values.
# Supports both scalar values and arrays with AND logic (all must be allowed).

import data.terraform.helpers.shared

# Identifies resources violating whitelist constraints
#
# Parameters:
#   tf_variables - Resource metadata (resource_type, friendly_resource_name, value_name)
#   attribute_path - Path to attribute being evaluated (array or string)
#   compliant_values - Array of allowed values
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, compliant_values) = results if {
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, compliant_values)
    results := {
        _build_violation(tf_variables, attribute_path, compliant_values, resource) |
        some resource in nc_resources
    }
}

_build_violation(tf_variables, attribute_path, compliant_values, resource) = violation if {
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
            compliant_values
        )
    }
}

# Check if a value is whitelisted (handles both scalars and arrays)
_is_whitelisted(allowed, value) if {
    # Array case: ALL elements must be allowed (AND logic)
    is_array(value)
    allowed_set := {x | some x in allowed}
    value_set := {x | some x in value}
    object.subset(allowed_set, value_set)
}

_is_whitelisted(allowed, value) if {
    # Scalar case: direct membership check
    shared.value_in_array(allowed, value)
}

_get_resources(resource_type, attribute_path, compliant_values) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        not _is_whitelisted(compliant_values, shared.get_attribute_value(resource, attribute_path))
    }
}

_format_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, compliant_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. It should be set to '%v'",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, compliant_values]
    )
}
