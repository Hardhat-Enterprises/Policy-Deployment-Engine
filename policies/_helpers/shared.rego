package terraform.helpers.shared

# Shared utility functions used by all policy modules
# No imports to avoid circular dependencies

################################################################################
# Resource Attribute Extraction
################################################################################

# Retrieves a resource's attribute value with defensive fallback logic
# 
# This function handles variations in Terraform resource structure by attempting
# multiple lookup paths. Different resource types and states (planned vs existing)
# may store attributes in different locations within the resource object.
#
# Lookup sequence:
#   1. resource.values[attribute_key] - Primary path for planned resource values
#   2. resource[attribute_key] - Fallback for direct attribute access
#   3. null - Returns null and prints diagnostic error if both paths fail
#
# Parameters:
#   tf_resource_object - A Terraform resource object from the plan
#   attribute_key - The attribute name to extract (e.g., "name", "id", "bucket")
#
# Returns:
#   Value of the specified attribute, or null if attribute doesn't exist
#
# Example: get_resource_attribute(s3_resource, "bucket") → "my-app-logs"
get_resource_attribute(tf_resource_object, attribute_key) = attribute_value if {
    tf_resource_object.values[attribute_key] 
    attribute_value := tf_resource_object.values[attribute_key]
} else = attribute_value if {
    attribute_value := tf_resource_object[attribute_key]
} else = null if {
    print(sprintf("Resource attribute '%s' for resource type '%s' was not found! Your 'resource_value_name' in vars is wrong. Try 'resource_value_name': 'name'.", [attribute_key, tf_resource_object.type]))
}

################################################################################
# Attribute Path Formatting
################################################################################
# This code is used by policies to convert error messages from:
# ["status", 0, "restricted_services"] → "status.[0].restricted_services"all this code 
# Converts values from an int to a string but leaves strings as is


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
# Data Normalization
################################################################################

# Normalizes input values into an array format
# Accepts either a single value or an array and ensures array output
# Used to handle flexible policy definition formats
ensure_array(values) = values if {
    is_array(values)
}
ensure_array(values) = [values] if {
    not is_array(values)
}

# Get attribute value from a resource with null fallback
# Simplifies the common pattern of accessing nested resource attributes
get_attribute_value(resource, attribute_path) := object.get(resource.values, attribute_path, null)

# Searches an array of objects for a specific key and returns its value
# Used to extract metadata from condition groups
get_value_from_array(arr, key) = value if {
    some i
    obj := arr[i]
    obj[key] != null
    value := obj[key]
}

################################################################################
# Empty Value Handling
################################################################################

# Returns warning string for empty values, empty string otherwise
# Handles empty strings and null values gracefully
empty_message(value) = " (EMPTY!)" if {
    value == ""
}

empty_message(value) = "" if {
    value != ""
}

################################################################################
# Array Membership Checking
################################################################################

# Generic helper: Check if a scalar value exists in an array
# Used by policy modules for simple membership testing
value_in_array(arr, value) if {
    not is_array(value)
    arr[_] == value
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