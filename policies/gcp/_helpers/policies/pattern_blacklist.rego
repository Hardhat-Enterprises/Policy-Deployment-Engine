package terraform.gcp.helpers.policies.pattern_blacklist

import data.terraform.gcp.helpers.shared


get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name) = results if {
    string_path := shared.format_attribute_path(attribute_path)
    results := # and their patterns
    [ { "name": shared.get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := _get_resources(resource_type, attribute_path, values_formatted)
    this_nc_resource = nc_resources[_]
    nc := _get_blacklist(this_nc_resource, attribute_path, values_formatted[0], values_formatted[1])
    this_nc := nc[_]
    msg := _format_message(friendly_resource_name, shared.get_resource_name(this_nc_resource, value_name), string_path, shared.final_formatter(object.get(this_nc_resource.values, attribute_path, null), this_nc.value), shared.empty_message(this_nc.value), this_nc.allowed)
    ]
}

_get_blacklist(resource, attribute_path, target, patterns) = ncc if {
    target_list = shared.get_target_list(resource, attribute_path, target) # list of targetted substrings
    ncc := [
        {"value": target_list[i], "allowed": patterns[i]} |
            some i
            shared.array_contains(patterns[i], target_list[i], "blacklist") # direct mapping of positions of target * with its list of allowed patterns
    ]
}

_get_resources(resource_type, attribute_path, values) = resources if {
    resources := [
        resource |
        target := values[0] # target val string
        patterns := values[1] # allowed patterns (list)
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        count(_get_blacklist(resource, attribute_path, target, patterns)) > 0 # ok, there is a resource with at least one non-compliant
    ]
}

_format_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'%s. This is blacklisted: %s",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values]
    )
}