package terraform.gcp.helpers

# For resource filtering
resource_type_match(resource, resource_type) if {
    resource.type == resource_type
}
 
# Collect all relevant resources
get_all_resources(resource_type) = resources if
{    
    resources := [
        resource |        
        resource := input.planned_values.root_module.resources[_]         
        resource_type_match(resource, resource_type)     
    ] 
}

# Collect non-compliant resources
get_nc_resources(resource_type, attribute_path, compliant_values) = resources if {
    is_array(compliant_values)
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        not array_contains(compliant_values, object.get(resource.values, attribute_path, null))
    ]
}

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

# Format violation messages
get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_array(compliant_values)
    is_string(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
    this_nc_resource = nc_resources[_] # for some nc resource
    msg := sprintf(
    "%s '%s' uses unapproved %s: '%s'",
    [friendly_resource_name, this_nc_resource.values.name, replace(attribute_path, "_", " "), object.get(this_nc_resource.values, attribute_path, null)]
    )
    ]
}

get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_boolean(compliant_values)
    is_string(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
    this_nc_resource = nc_resources[_] # for some nc resource
        msg := sprintf(
        "%s '%s' has '%s' set to '%s'. It should be set to '%s'",
        [friendly_resource_name, this_nc_resource.values.name, replace(attribute_path, "_", " "), object.get(this_nc_resource.values, attribute_path, null), compliant_values]
        ) 
    ]
}
# Overloaded this method to accept an array as 
get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_array(compliant_values)
    is_array(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
    this_nc_resource = nc_resources[_] # for some nc resource
    msg := sprintf(
    "%s '%s' uses unapproved %s: '%s'",
    [friendly_resource_name, this_nc_resource.values.name, array.reverse(attribute_path)[0], object.get(this_nc_resource.values, attribute_path, null)]
    )
    ]
}

get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_boolean(compliant_values)
    is_array(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
    this_nc_resource = nc_resources[_] # for some nc resource
        msg := sprintf(
        "%s '%s' has '%s' set to '%s'. It should be set to '%s'",
        [friendly_resource_name, this_nc_resource.values.name, array.reverse(attribute_path)[0], object.get(this_nc_resource.values, attribute_path, null), compliant_values]
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