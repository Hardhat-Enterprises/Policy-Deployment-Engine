package terraform.helpers.policies.range

# Range Policy
#
# Detects resources with numeric attributes outside specified bounds.
# Both lower and upper bounds are required.
#
# Example: [10, 100] requires value between 10 and 100 (inclusive)

import data.terraform.helpers.shared

################################################################################
# Range Validation Utilities
################################################################################

# Checks if a value is within the specified range (inclusive)
_test_value_range(value, lower_bound, upper_bound) if {
    value >= lower_bound
    value <= upper_bound
}

################################################################################
# Public API
################################################################################

# Identifies resources with numeric attributes outside specified range
#
# Parameters:
#   tf_variables - Resource metadata
#   attribute_path - Path to numeric attribute
#   values_formatted - Two-element array [lower_bound, upper_bound]
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, values_formatted) = results if {
    count(values_formatted) == 2
    lower_bound := values_formatted[0]
    upper_bound := values_formatted[1]
    
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, lower_bound, upper_bound)
    results := {
        _build_violation(tf_variables, attribute_path, lower_bound, upper_bound, resource) |
        some resource in nc_resources
    }
}

_build_violation(tf_variables, attribute_path, lower_bound, upper_bound, resource) = violation if {
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
            lower_bound,
            upper_bound
        )
    }
}

_get_resources(resource_type, attribute_path, lower_bound, upper_bound) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        attribute_value := to_number(shared.get_attribute_value(resource, attribute_path))
        not _test_value_range(attribute_value, lower_bound, upper_bound)
    }
}

_format_message(
    friendly_resource_name,
    resource_value_name,
    attribute_path_string,
    nc_value,
    empty,
    lower_bound,
    upper_bound
) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. It must be between %v and %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, lower_bound, upper_bound]
    )
}
