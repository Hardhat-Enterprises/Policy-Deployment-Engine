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
    msg := sprintf(
    "%s '%s' uses unapproved %s: '%s'",
    [friendly_resource_name, nc_resources[_].values.name, replace(attribute_path, "_", " "), object.get(nc_resources[_].values, attribute_path, null)]
    )
    ]
}

get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_boolean(compliant_values)
    is_string(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
        msg := sprintf(
        "%s '%s' has '%s' set to '%s'. It should be set to '%s'",
        [friendly_resource_name, nc_resources[_].values.name, replace(attribute_path, "_", " "), object.get(nc_resources[_].values, attribute_path, null), compliant_values]
        ) 
    ]
}

get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_array(compliant_values)
    is_array(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
    msg := sprintf(
    "%s '%s' uses unapproved %s: '%s'",
    [friendly_resource_name, nc_resources[_].values.name, concat(".", get_attribute_path(attribute_path)), object.get(nc_resources[_].values, attribute_path, null)]
    )
    ]
}

get_violations(resource_type, attribute_path, compliant_values, friendly_resource_name) = violations if { 
    is_boolean(compliant_values)
    is_array(attribute_path)
    violations := 
    [msg |
    nc_resources := get_nc_resources(resource_type, attribute_path, compliant_values)
        msg := sprintf(
        "%s '%s' has '%s' set to '%s'. It should be set to '%s'",
        [friendly_resource_name, nc_resources[_].values.name, concat(".", get_attribute_path(attribute_path)), object.get(nc_resources[_].values, attribute_path, null), compliant_values]
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

# Converts each entry in attribute path into a string
get_attribute_path(attribute_path) = result if {
    is_array(attribute_path)
    result := [ val |
        x := attribute_path[_]
        val := convert_value(x)
  ]
}

convert_value(x) = string if {
  type_name(x) == "number"
  string := sprintf("[%v]", [x])
}

convert_value(x) = x if {
  type_name(x) == "string"
}