package terraform.helpers.policies.element_pattern_whitelist

# Element Pattern Whitelist Policy
#
# Detects array attributes where any element does NOT match a required
# wildcard resource-path shape, e.g. projects/*/locations/*/apps/*/guardrails/*.
# Each '*' matches one or more non-'/' characters (a single path segment).
#
# Example:
#   pattern: "projects/*/locations/*/apps/*/guardrails/*"
#   Violates if any array element is not shaped like that (e.g. a bare name).

import data.terraform.helpers.shared

# Identifies resources with array elements that fail the required shape.
#
# Parameters:
#   tf_variables - Resource metadata (resource_type, friendly_resource_name,
#                  resource_value_name)
#   attribute_path - Path to the array attribute
#   values_formatted - [pattern] where pattern is the required wildcard shape
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, values_formatted) = results if {
    pattern := values_formatted[0]
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, pattern)
    results := {
        _build_violation(tf_variables, attribute_path, pattern, resource) |
        some resource in nc_resources
    }
}

_build_violation(tf_variables, attribute_path, pattern, resource) = violation if {
    attribute_path_string := shared.format_attribute_path(attribute_path)
    array_value := shared.get_attribute_value(resource, attribute_path)
    bad := [element |
        element := array_value[_]
        not _matches(pattern, element)
    ]

    violation := {
        "name": shared.get_resource_attribute(resource, tf_variables.resource_value_name),
        "message": _format_message(
            tf_variables.friendly_resource_name,
            shared.get_resource_attribute(resource, tf_variables.resource_value_name),
            attribute_path_string,
            bad,
            pattern,
        ),
    }
}

# An element matches when it fits the wildcard shape: '*' becomes one or more
# non-'/' characters, so a '*' can never span path segments.
_matches(pattern, value) if {
    p := regex.replace(pattern, "\\*", "[^/]+")
    regex.match(sprintf("^%s$", [p]), value)
}

# get_resources() filters Terraform resources that have at least one array
# element failing the required shape.
_get_resources(resource_type, attribute_path, pattern) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        array_value := shared.get_attribute_value(resource, attribute_path)
        is_array(array_value)
        count([1 |
            element := array_value[_]
            not _matches(pattern, element)
        ]) > 0
    }
}

_format_message(friendly_resource_name, resource_value_name, attribute_path_string, bad, pattern) = msg if {
    msg := sprintf("%s '%s' has '%s' with elements not matching the required shape '%s': %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, pattern, bad])
}
