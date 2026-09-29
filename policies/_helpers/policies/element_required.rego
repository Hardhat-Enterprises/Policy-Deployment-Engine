package terraform.helpers.policies.element_required

# Element Required Policy
#
# Checks that a list attribute contains every value in `values`. A resource is
# non-compliant when at least one required value is missing from the list.
#
# The attribute may be a list, a single string (treated as a one-item list) or
# unset. Unset counts as an empty list, so every required value is missing and
# the resource is flagged. Pair this with a "match": "all" situation when the
# requirement should only apply while another setting is present.

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the list, and the values it must contain.
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, required_values) := results if {
    non_compliant_resources := _get_resources(
        tf_variables.resource_type,
        attribute_path,
        required_values,
    )

    results := {
    _build_violation(
        tf_variables,
        attribute_path,
        required_values,
        resource,
    ) |
        some resource in non_compliant_resources
    }
}

# Find resources whose list is missing at least one required value.
_get_resources(resource_type, attribute_path, required_values) := resources if {
    resources := {
    resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        count(_missing_values(resource, attribute_path, required_values)) > 0
    }
}

# Read the attribute, treating a missing path the same as null.
_value(resource, attribute_path) := value if {
    value := shared.get_attribute_value(resource, attribute_path)
} else := null

# Normalise the attribute to a list: unset is empty, a string is one item.
_as_list(value) := [] if {
    value == null
}

_as_list(value) := value if {
    is_array(value)
}

_as_list(value) := [value] if {
    is_string(value)
}

# The required values that are not present in the resource's list.
_missing_values(resource, attribute_path, required_values) := missing if {
    present := {item | some item in _as_list(_value(resource, attribute_path))}
    missing := {required |
        some required in required_values
        not required in present
    }
}

# Build the violation object expected by helpers.get_multi_summary.
_build_violation(tf_variables, attribute_path, required_values, resource) := violation if {
    resource_name := shared.get_resource_attribute(
        resource,
        tf_variables.resource_value_name,
    )

    missing := sort([sprintf("%v", [item]) |
        some item in _missing_values(resource, attribute_path, required_values)
    ])

    violation := {
        "name": resource_name,
        "message": sprintf(
            "%s '%s' is missing required value(s) in '%s': %s",
            [
                tf_variables.friendly_resource_name,
                resource_name,
                shared.format_attribute_path(attribute_path),
                concat(", ", missing),
            ],
        ),
    }
}