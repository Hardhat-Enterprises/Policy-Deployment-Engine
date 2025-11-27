package terraform.helpers.policies.range

import data.terraform.helpers.shared

# Helper function to check if a value is null or a number
is_null_or_number(value) if {
    is_null(value)  # true if value is null
}

is_null_or_number(value) if {
    type_name(value) == "number"  # true if value is a number
}

    
get_upper_bound(range_values) = bound if {
    not is_null(range_values.upper_bound)
    bound := sprintf("%v", [range_values.upper_bound])
}
get_upper_bound(range_values) = "Inf" if {
    is_null(range_values.upper_bound)
}

get_lower_bound(range_values) = bound if {
    not is_null(range_values.lower_bound)
    bound := sprintf("%v", [range_values.lower_bound])
}
get_lower_bound(range_values) = "-Inf" if {
    is_null(range_values.lower_bound)
}

format_range_input(lower,upper) = range_values if {
    is_null_or_number(lower)
    is_null_or_number(upper)
    range_values := {"lower_bound":lower,"upper_bound":upper}
}

# Checks a value sits between a given range of a passed object with keys upper_bound and lower_bound
test_value_range(range_values, value) if {
    test_lower_range(range_values, value)
    test_upper_range(range_values, value)
}

test_lower_range(range_values,value) = true if {
    # Check value exists
    not is_null(range_values.lower_bound)
    value >= range_values.lower_bound
}

# Null indicates no lower bound
test_lower_range(range_values,value) = true if {
    is_null(range_values.lower_bound)
}

test_upper_range(range_values,value) = true if {
    # Check value exists
    not is_null(range_values.upper_bound)
    value <= range_values.upper_bound
}

# Null indicates no higher bound
test_upper_range(range_values,value) = true if {
    is_null(range_values.upper_bound)
}



get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name) = results if {
    # Format the input values into range object
    values_formatted_range := format_range_input(values_formatted[0], values_formatted[1])
    string_path := shared.format_attribute_path(attribute_path)
    results :=
    [ { "name": shared.get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := _get_resources(resource_type, attribute_path, values_formatted_range)
    this_nc_resource = nc_resources[_]
    this_nc_attribute = object.get(this_nc_resource.values, attribute_path, null)
    msg := _format_range_validation_message(friendly_resource_name, shared.get_resource_name(this_nc_resource, value_name), string_path, this_nc_attribute, shared.empty_message(this_nc_attribute), values_formatted_range)
    ]
}

_get_resources(resource_type, attribute_path, range_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        # Test array of array and deeply nested values
        not test_value_range(range_values, to_number(object.get(resource.values, attribute_path, null)))
    ]
}


_format_range_validation_message(
    friendly_resource_name,
    resource_value_name,
    attribute_path_string,
    nc_value,
    empty,
    range_values
) = msg if {
    lower := get_lower_bound(range_values)
    upper := get_upper_bound(range_values)

    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. It must be between %v and %v",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, lower, upper]
    )
}


# _format_range_validation_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, range_values) = msg if {
#     upper_bound := get_upper_bound(range_values)
#     lower_bound := get_lower_bound(range_values)
#     msg := sprintf(
#         "%s '%s' has '%s' set to '%s'%s. It should be set between '%s and %s'.",
#         [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, lower_bound, upper_bound]
#     )
# }