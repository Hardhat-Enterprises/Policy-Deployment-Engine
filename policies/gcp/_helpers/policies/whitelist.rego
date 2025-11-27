package terraform.gcp.helpers.policies.whitelist

import data.terraform.gcp.helpers.shared

get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name, value_name) = results if {
    string_path := shared.format_attribute_path(attribute_path)
    results :=
    [ { "name": shared.get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := _get_resources(resource_type, attribute_path, compliant_values)
    this_nc_resource = nc_resources[_]
    this_nc_attribute = object.get(this_nc_resource.values, attribute_path, null)
    msg := _format_message(friendly_resource_name, shared.get_resource_name(this_nc_resource, value_name), string_path, this_nc_attribute, shared.empty_message(this_nc_attribute), compliant_values)
    ]
}

_get_resources(resource_type, attribute_path, compliant_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        # Test array of array and deeply nested values
        not shared.array_contains(compliant_values, object.get(resource.values, attribute_path, null), "whitelist")
    ]
}

_format_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, compliant_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. It should be set to '%v'",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, compliant_values]
    )
}
