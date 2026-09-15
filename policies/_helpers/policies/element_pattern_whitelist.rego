package terraform.helpers.policies.element_pattern_whitelist

# Element Pattern Whitelist Policy
#
# Detects array attributes where any element does NOT match a required
# wildcard resource-path shape, e.g. projects/*/locations/*/apps/*/guardrails/*.
# Each '*' matches one or more non-'/' characters (a single path segment), and
# every other character is matched literally (regex metacharacters such as '.'
# and '(' are escaped before building the regex).
#
# values is exactly [pattern] — a single shape string, nothing else. Only the
# array attribute is examined: a missing attribute, a non-list value, or an
# empty list produces no violations (there is nothing to check, or nothing to
# fail the shape).
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
#   values_formatted - [pattern]; pattern is the required wildcard shape. The
#                      list holds exactly one element, so values_formatted[1]
#                      is never read.
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

# Builds the {name, message} violation object for one non-compliant resource.
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

# An element matches when it fits the wildcard shape. '*' is the only special
# character and becomes one or more non-'/' characters, so a '*' never spans a
# path segment ('/'). Every other character is matched literally: regex
# metacharacters such as '.' and '(' are escaped before building the regex.
_matches(pattern, value) if {
    parts := split(pattern, "*")
    escaped := [_escape(part) | part := parts[_]]
    p := concat("[^/]+", escaped)
    regex.match(sprintf("^%s$", [p]), value)
}

# Escapes regex metacharacters in a pattern segment so the rest matches literally.
_escape(segment) := regex.replace(segment, "([.+?()\\[\\]{}\\^$|\\\\])", "\\$1")

# _get_resources() filters Terraform resources of the target type that have at
# least one array element failing the required shape.
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

# Formats the human-readable violation message.
_format_message(friendly_resource_name, resource_value_name, attribute_path_string, bad, pattern) = msg if {
    msg := sprintf("%s '%s' has '%s' with elements not matching the required shape '%s': %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, pattern, bad])
}
