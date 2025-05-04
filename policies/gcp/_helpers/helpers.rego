package terraform.gcp.helpers

# For resource filtering
resource_type_match(resource, resource_type) if {
    resource.type == resource_type
}

# Collect all relevant resources
get_all_resources(resource_type) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
    ]
}

# Get a human-readable name for any resource
resource_display_name(r) = name if {
    name := object.get(r.values, "domain_name", "")
    name != ""
} else = name if {
    name := object.get(r.values, "connection_profile_id", "")
    name != ""
} else = name if {
    name := object.get(r.values, "bucket", "")
    name != ""
} else = name if {
    name := object.get(r.values, "name", "")
    name != ""
} else = name if {
    name := r.address
}

# Collect non-compliant resources (Array)
get_nc_resources(resource_type, attribute_path, compliant_values) = resources if {
    is_array(compliant_values)
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        not array_contains(compliant_values, object.get(resource.values, attribute_path, null))
    ]
}

# Collect non-compliant resources (Boolean)
get_nc_resources(resource_type, attribute_path, compliant_values) = resources if {
    is_boolean(compliant_values)
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        not equal(compliant_values, object.get(resource.values, attribute_path, null))
    ]
}

# Helper: Check if value exists in array
array_contains(arr, elem) if {
    arr[_] == elem
}

# Format violation messages for array
get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if {
    is_array(compliant_values)
    violations := [
        msg |
        nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
        msg := sprintf(
            "%s '%s' uses unapproved %s: '%s'",
            [friendly_resource_name, resource_display_name(nc_resources[_]), replace(attribute_path, "", " "), object.get(nc_resources[_].values, attribute_path, null)]
        )
    ]
}

# Format violation messages for boolean
get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if {
    is_boolean(compliant_values)
    violations := [
        msg |
        nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
        msg := sprintf(
            "%s '%s' has '%s' set to '%s'. It should be set to '%s'",
            [friendly_resource_name, resource_display_name(nc_resources[_]), replace(attribute_path, "", " "), object.get(nc_resources[_].values, attribute_path, null), compliant_values]
        )
    ]
}

# Summary output
get_summary(resource_type, attribute_path, compliant_values, friendly_resource_name) = summary if {
    all_resources_count := count(get_all_resources(resource_type))
    violations := get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name)
    violations_count := count(violations)
    summary := {
        "message": array.concat(
            [
                sprintf("Total %s detected: %d", [friendly_resource_name, all_resources_count]),
                sprintf("Non-compliant %s: %d/%d", [friendly_resource_name, violations_count, all_resources_count])
            ],
            violations
        )
    }
}