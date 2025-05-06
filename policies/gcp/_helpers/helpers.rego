package terraform.gcp.helpers

# Match resource types
resource_type_match(resource, resource_type) if{
    resource.type == resource_type
}

# Get all resources of a type
get_all_resources(resource_type) = resources if{
    resources := [r | 
        r := input.planned_values.root_module.resources[_]
        resource_type_match(r, resource_type)
    ]
}

# Check if array contains an element
array_contains(arr, elem) if{
    some i
    arr[i] == elem
}

# Get non-compliant resources (array case)
get_nc_resources(resource_type, attribute_path, allowed_values) = resources if{
    is_array(allowed_values)
    resources := [r |
        r := input.planned_values.root_module.resources[_]
        resource_type_match(r, resource_type)
        val := object.get(r.values, attribute_path, null)
        not array_contains(allowed_values, val)
    ]
}

# Get non-compliant resources (boolean case)
get_nc_resources(resource_type, attribute_path, allowed_value) = resources if{
    is_boolean(allowed_value)
    resources := [r |
        r := input.planned_values.root_module.resources[_]
        resource_type_match(r, resource_type)
        val := object.get(r.values, attribute_path, null)
        val != allowed_value
    ]
}

# === Violation Message Logic === #

# For array-based attribute path
get_violations(resource_type, attribute_path, allowed_values, friendly_name) = violations if{
    is_array(allowed_values)
    is_string(attribute_path)
    violations := [msg |
        r := get_nc_resources(resource_type, attribute_path, allowed_values)[_]
        val := object.get(r.values, attribute_path, null)
        resource_id := object.get(r.values, "name", r.name)
        msg := sprintf("%s '%s' uses unapproved %s: '%s'", 
            [friendly_name, resource_id, replace(attribute_path, "_", " "), val])
    ]
}

# For boolean-based attribute path
get_violations(resource_type, attribute_path, allowed_values, friendly_name) = violations if{
    is_boolean(allowed_values)
    is_string(attribute_path)
    violations := [msg |
        r := get_nc_resources(resource_type, attribute_path, allowed_values)[_]
        val := object.get(r.values, attribute_path, null)
        resource_id := object.get(r.values, "name", r.name)
        msg := sprintf("%s '%s' has '%s' set to '%s'. It should be set to '%s'", 
            [friendly_name, resource_id, replace(attribute_path, "_", " "), val])
    ]
}

# Overloaded: For array-based attribute path as it is 
get_violations(resource_type, attribute_path, allowed_values, friendly_name) = violations if{
    is_array(allowed_values)
    is_array(attribute_path)
    violations := [msg |
        r := get_nc_resources(resource_type, attribute_path, allowed_values)[_]
        val := object.get(r.values, attribute_path, null)
        resource_id := object.get(r.values, "name", r.name)
        msg := sprintf("%s '%s' has '%s' set to '%s'. It should be set to '%s'", 
            [friendly_name, resource_id, replace(attribute_path, "_", " "), val])
    ]
}

# === Summary Message === #

get_summary(resource_type, attribute_path, allowed_values, friendly_name) = summary if{
    total := count(get_all_resources(resource_type))
    violations := get_violations(resource_type, attribute_path, allowed_values, friendly_name)
    summary := {
        "message": array.concat([
            sprintf("Total %s detected: %d", [friendly_name, total]),
            sprintf("Non-compliant %s: %d/%d", [friendly_name, count(violations), total])
        ], violations)
    }
}

get_multi_summary(resource_type, compliance_conditions, friendly_resource_name) = summary if {
    all_resources := get_all_resources(resource_type)

    violations := [
        msg |
        condition := compliance_conditions[_]
        attr := condition.attribute_path
        val := condition.compliant_values
        vs := get_violations(resource_type, attr, val, friendly_resource_name)
        msg := vs[_]
    ]

    summary := {
        "message": array.concat(
            [
                sprintf("Total %s detected: %d", [friendly_resource_name, count(all_resources)]),
                sprintf("Non-compliant %s: %d/%d", [friendly_resource_name, count(violations), count(all_resources)])
            ],
            violations
        )
    }
}

# Checks if attribute contains blacklisted keyword
get_blacklist_violations(resource_type, attr, blacklist, friendly_name) = msgs if {
  msgs := [
    sprintf("%s '%s' has blacklisted value in '%s': '%s'", 
            [friendly_name, r.values.name, attr, val]) |
    r := input.planned_values.root_module.resources[_]
    r.type == resource_type
    val := object.get(r.values, attr, "")
    keyword := blacklist[_]
    contains(val, keyword)
  ]
}

