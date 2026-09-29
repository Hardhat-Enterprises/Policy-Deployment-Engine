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
#
# Enhanced: Array-of-Objects Field Extraction (Added 2025-12-04)
# When the attribute path ends with a string field name and leads to an array of objects,
# this function automatically extracts that field from each object in the array.
get_attribute_value(resource, attribute_path) := extracted_values if {
    # Check if this might be an array-of-objects extraction pattern
    count(attribute_path) > 1
    last_element := attribute_path[count(attribute_path) - 1]
    is_string(last_element)
    
    # Get the path to the array (everything except the last element)
    array_path := array.slice(attribute_path, 0, count(attribute_path) - 1)
    array_value := object.get(resource.values, array_path, null)
    
    # If it's an array of objects, extract the field from each
    is_array(array_value)
    count(array_value) > 0
    is_object(array_value[0])
    
    # Extract the field from each object in the array
    extracted_values := [obj[last_element] | obj := array_value[_]; obj[last_element] != null]
} else := object.get(resource.values, attribute_path, null)

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
################################################################################
# Every-Element Attribute Lookup
################################################################################

# Returns one {"path", "value"} entry for every place attribute_path reaches in
# the resource, fanning out across every element of every repeated block on the
# way. Terraform plans write nested blocks as lists, so
#   ["network_interface", "access_config"]
# yields one entry per network interface, and
#   ["rules", "action", "redirect", "https_redirect"]
# yields one entry per configured redirect in every action of every rule.
#
# A numeric index in attribute_path still selects only that element:
# ["network_interface", 0, "access_config"] yields the first interface only.
#
# "path" is the concrete path including the list indexes that were filled in,
# ready for format_attribute_path. "value" is null when the final key is absent
# from an element that exists. When a parent block is not configured (missing,
# null or an empty list) there is no element, so no entry is returned for it.
#
# The final value is never fanned out: for ["disk", 0, "guest_os_features"] the
# entry's value is the whole list.
attribute_entries(resource, attribute_path) := entries if {
    count(attribute_path) > 0
    parent_pattern := array.slice(attribute_path, 0, count(attribute_path) - 1)
    key := attribute_path[count(attribute_path) - 1]
    entries := {entry |
        some parent in _parent_matches(resource.values, parent_pattern)
        some entry in _leaf_entries(parent.path, parent.value, key)
    }
}

# Every node in values whose path matches the pattern once list indexes are
# filled in. The empty pattern is the resource's values themselves.
_parent_matches(values, pattern) := {{"path": [], "value": values}} if {
    count(pattern) == 0
}

_parent_matches(values, pattern) := {{"path": p, "value": v} |
    walk(values, [p, v])
    _path_matches(p, pattern)
} if {
    count(pattern) > 0
}

# A string key under a single block: look it up, null when absent.
_leaf_entries(path, parent, key) := {{"path": array.concat(path, [key]), "value": object.get(parent, key, null)}} if {
    is_string(key)
    is_object(parent)
}

# A string key under a repeated block: one entry per element.
_leaf_entries(path, parent, key) := {{"path": array.concat(path, [i, key]), "value": object.get(element, key, null)} |
    some i, element in parent
    is_object(element)
} if {
    is_string(key)
    is_array(parent)
}

# An explicit index at the end of the path.
_leaf_entries(path, parent, key) := {{"path": array.concat(path, [key]), "value": parent[key]}} if {
    is_number(key)
    is_array(parent)
    key < count(parent)
}

# A concrete path p matches a pattern when they name the same keys in the same
# order, end on the same key, every number in p follows a key (one list level),
# every number in the pattern is matched by the same number in p after the same
# key, and every other number in p is a filled-in list index.
_path_matches(p, pattern) if {
    count(p) >= count(pattern)
    [x | some x in p; is_string(x)] == [x | some x in pattern; is_string(x)]
    p[count(p) - 1] == pattern[count(pattern) - 1]
    every i, x in p {
        _single_list_level(p, i, x)
    }
    _explicit_indexes_match(p, pattern)
}

_single_list_level(_, _, x) if is_string(x)

_single_list_level(p, i, x) if {
    is_number(x)
    i > 0
    is_string(p[i - 1])
}

_explicit_indexes_match(p, pattern) if {
    every j, n in pattern {
        _index_matches(p, pattern, j, n)
    }
}

_index_matches(_, _, _, n) if not is_number(n)

_index_matches(p, pattern, j, n) if {
    is_number(n)
    some i, m in p
    m == n
    _strings_before(p, i) == _strings_before(pattern, j)
}

_strings_before(xs, i) := count([1 | some t, x in xs; t < i; is_string(x)])

################################################################################
# Wildcard Shape Matching
################################################################################

# True when value fits the wildcard shape. '*' is the only special character and
# matches one or more non-'/' characters, so a '*' never spans a path segment.
# Every other character is matched literally: regex metacharacters such as '.'
# and '(' are escaped before the regex is built. Used by element pattern
# whitelist and map key pattern whitelist so both always match the same way.
wildcard_match(pattern, value) if {
    is_string(pattern)
    is_string(value)
    parts := split(pattern, "*")
    escaped := [_escape_regex(part) | some part in parts]
    regex.match(sprintf("^%s$", [concat("[^/]+", escaped)]), value)
}

_escape_regex(segment) := regex.replace(segment, "([.+?()\\[\\]{}\\^$|\\\\])", "\\$1")
