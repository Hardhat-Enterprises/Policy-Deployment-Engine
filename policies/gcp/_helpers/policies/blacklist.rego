package terraform.gcp.helpers.policies.blacklist

import data.terraform.gcp.helpers.shared

get_violations(resource_type, attribute_path, blacklisted_values, friendly_resource_name, value_name) = results if {
    string_path := shared.format_attribute_path(attribute_path)
    results :=
    [ { "name": shared.get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := _get_resources(resource_type, attribute_path, blacklisted_values)
    this_nc_resource = nc_resources[_]
    this_nc_attribute = object.get(this_nc_resource.values, attribute_path, null)
    msg := _format_message(friendly_resource_name, shared.get_resource_name(this_nc_resource, value_name), string_path, this_nc_attribute, shared.empty_message(this_nc_attribute), blacklisted_values)
    ]
}

_get_resources(resource_type, attribute_path, blacklisted_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        # Test array of array and deeply nested values
        shared.array_contains(blacklisted_values, object.get(resource.values, attribute_path, null), "blacklist")
    ]
}

_format_message(friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values) = msg if {
        msg := sprintf(
        #Change message however we want it displayed
        "%s '%s' has '%s' set to '%v'%s. This is blacklisted: %v",
        [friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values]
        )
}