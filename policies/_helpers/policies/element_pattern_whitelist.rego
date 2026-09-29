package terraform.helpers.policies.element_pattern_whitelist

# Element Pattern Whitelist Policy
#
# Detects array attributes where any element does NOT match a required
# wildcard resource-path shape, e.g. projects/*/locations/*/apps/*/guardrails/*.
# Each '*' matches one or more non-'/' characters (a single path segment), and
# every other character is matched literally (regex metacharacters such as '.'
# and '(' are escaped before building the regex).
#
# values is a list of wildcard shapes; an element is compliant if it matches
# any one of them (OR). A string value is checked as a one-item list. A missing
# attribute or an empty list produces no violations (nothing to check).
#
# Example:
#   pattern: "projects/*/locations/*/apps/*/guardrails/*"
#   Violates if any array element is not shaped like that (e.g. a bare name).

import data.terraform.helpers.shared

# Identifies resources whose elements fail every one of the required shapes.
#
# Parameters:
#   tf_variables - Resource metadata (resource_type, friendly_resource_name,
#                  resource_value_name)
#   attribute_path - Path to the array attribute
#   values_formatted - list of wildcard shapes; an element passes if it matches
#                      any one of them
#
# Returns:
#   Set of violation objects with {name, message}
get_violations(tf_variables, attribute_path, values_formatted) = results if {
    patterns := values_formatted
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, patterns)
    results := {
        _build_violation(tf_variables, attribute_path, patterns, resource) |
        some resource in nc_resources
    }
}

# Builds the {name, message} violation object for one non-compliant resource.
_build_violation(tf_variables, attribute_path, patterns, resource) = violation if {
    attribute_path_string := shared.format_attribute_path(attribute_path)
    array_value := _as_list(shared.get_attribute_value(resource, attribute_path))
    bad := [element |
        element := array_value[_]
        not _matches_any(patterns, element)
    ]

    violation := {
        "name": shared.get_resource_attribute(resource, tf_variables.resource_value_name),
        "message": _format_message(
            tf_variables.friendly_resource_name,
            shared.get_resource_attribute(resource, tf_variables.resource_value_name),
            attribute_path_string,
            bad,
            patterns,
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

# An element is compliant if it matches any one of the required shapes.
_matches_any(patterns, value) if {
    some pattern in patterns
    _matches(pattern, value)
}

# Escapes regex metacharacters in a pattern segment so the rest matches literally.
_escape(segment) := regex.replace(segment, "([.+?()\\[\\]{}\\^$|\\\\])", "\\$1")

# Normalises the attribute value to a list: a string is checked as a one-item
# list; anything that is neither a list nor a string (e.g. a missing attribute)
# is left undefined so the resource is skipped rather than flagged.
_as_list(value) := value if {
    is_array(value)
}

_as_list(value) := [value] if {
    is_string(value)
}

# _get_resources() filters Terraform resources of the target type that have at
# least one element failing every one of the required shapes.
_get_resources(resource_type, attribute_path, patterns) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        array_value := _as_list(shared.get_attribute_value(resource, attribute_path))
        count([1 |
            element := array_value[_]
            not _matches_any(patterns, element)
        ]) > 0
    }
}

# Formats the human-readable violation message.
_format_message(friendly_resource_name, resource_value_name, attribute_path_string, bad, patterns) = msg if {
    msg := sprintf("%s '%s' has '%s' with elements not matching any required shape %v: %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, patterns, bad])
}
