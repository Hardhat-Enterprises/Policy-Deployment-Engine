package terraform.helpers.shared

# Shared utility functions used by all policy modules
# No imports to avoid circular dependencies

################################################################################
# Resource Name Extraction
################################################################################

# Extract resource identifier with fallback lookup: .values[key] → root[key] → null
# Used by all policy types to identify non-compliant resources in violation reports
# Tries: 1) resource.values[value_name], 2) resource[value_name], 3) returns null with error
# Example: get_resource_name(resource, "name") → "my-bucket-name"
get_resource_name(this_nc_resource, value_name) = resource_name if {
    this_nc_resource.values[value_name] 
    resource_name := this_nc_resource.values[value_name]
} else = resource_name if {
    resource_name := this_nc_resource[value_name]
} else = null if {
    print(sprintf("Resource name for '%s' was not found! Your 'resource_value_name' in vars is wrong. Try 'resource_value_name': 'name'.", [this_nc_resource.type]))
}

################################################################################
# Attribute Path Formatting
################################################################################

# Converts values from an int to a string but leaves strings as is
convert_value(x) = string if {
  type_name(x) == "number"
  string := sprintf("[%v]", [x])
}

convert_value(x) = x if {
  type_name(x) == "string"
}

# Converts each entry in attribute path into a string
get_attribute_path(attribute_path) = result if {
    is_array(attribute_path)
    result := [ val |
        x := attribute_path[_]
        val := convert_value(x)
  ]
}

# Returns a formatted string of any given attribute path
# Example: ["status", 0, "restricted_services"] → "status.[0].restricted_services"
format_attribute_path(attribute_path) = string_path if {
    is_array(attribute_path)
    string_path := concat(".", get_attribute_path(attribute_path))
}

format_attribute_path(attribute_path) = string_path if {
    is_string(attribute_path)
    string_path := replace(attribute_path, "_", " ")
}

################################################################################
# Empty Value Handling
################################################################################

# Check if value is empty string
is_empty(value) if {
    value == ""
}

# Returns warning string if value is empty, empty string otherwise
empty_message(value) = msg if {
    is_empty(value)
    msg = " (!!!EMPTY!!!)"
}

empty_message(value) = msg if {
    not is_empty(value)
    msg = ""
}

################################################################################
# Array Membership Checking
################################################################################

# Handle empty array blacklisting specifically
array_contains(arr, elem, pol) if {
    pol == "blacklist"
    [] in arr  # Check if empty array is in blacklisted values
    is_array(elem)
    count(elem) == 0  # elem is empty
}

# if elem is an array; checks if elem contains any blacklisted items. e.g., elem=[w, r, a], arr=[a] -> true
array_contains(arr, elem, pol) if {
    is_array(elem)
    pol == "blacklist"
    arr_to_set = {x | x := arr[_]}
    elem_to_set = {x | x := elem[_]}
    count(arr_to_set & elem_to_set) > 0
}

# if elem is an array; checks if elem is at least a subset of arr. e.g., elem=[write, read], arr=[read, write, eat] -> true
array_contains(arr, elem, pol) if {
    is_array(elem)
    pol == "whitelist"
    arr_to_set = {x | x := arr[_]}
    elem_to_set = {x | x := elem[_]}
    object.subset(arr_to_set, elem_to_set)
}

# Generic helper: Check if value exists in array
array_contains(arr, elem, pol) if {
    not is_array(elem)
    arr[_] == elem
}

################################################################################
# Regex Pattern Utilities (for pattern policies)
################################################################################

# Gets the target * pattern - extracts substrings matching wildcard positions
get_target_list(resource, attribute_path, target) = target_list if {
    p := regex.replace(target, "\\*", "([^/]+)")
    target_value := object.get(resource.values, attribute_path, null)
    matches := regex.find_all_string_submatch_n(p, target_value, 1)[0] # all matches, including main string
    target_list := array.slice(matches, 1, count(matches)) # leaves every single * match except main string
} else := "Wrong pattern"

# Formats pattern with quotes for display
final_formatter(target, sub_pattern) = final_format if {
    final_format := regex.replace(target, sub_pattern, sprintf("'%s'", [sub_pattern]))
}