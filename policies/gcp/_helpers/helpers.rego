package terraform.gcp.helpers

policy_types := ["blacklist", "whitelist", "range", "pattern blacklist", "pattern whitelist"]

# Check if value exists in array
array_contains(arr, elem) if {
  arr[_] == elem
}

# Match resource type
resource_type_match(resource, resource_type) if {
  resource.type == resource_type
}

# Collect all resources of a type
get_all_resources(resource_type) := resources if {
  resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource_type_match(resource, resource_type)
  ]
}

# Extract policy type
get_policy_type(chosen_type) := policy_type if {
  policy_type := policy_types[_]
  policy_type == chosen_type
}

# Convert number to string
convert_value(x) := s if {
  type_name(x) == "number"
  s := sprintf("[%v]", [x])
}
convert_value(x) := x if {
  type_name(x) == "string"
}

# Convert attribute path to string list
get_attribute_path(attribute_path) := result if {
  is_array(attribute_path)
  result := [val |
    x := attribute_path[_]
    val := convert_value(x)
  ]
}

# Format attribute path to a dotted string
format_attribute_path(attribute_path) := string_path if {
  is_array(attribute_path)
  string_path := concat(".", get_attribute_path(attribute_path))
}
format_attribute_path(attribute_path) := string_path if {
  is_string(attribute_path)
  string_path := replace(attribute_path, "_", " ")
}

# Ensure we always work with an array
array_check(values) := result if {
  t := type_name(values)
  t != "array"
  result := [values]
}
array_check(values) := result if {
  t := type_name(values)
  t == "array"
  result := values
}

# Empty checks
is_empty(value) if {
  value == ""
}

empty_message(value) := msg if {
  is_empty(value)
  msg := " (!!!EMPTY!!!)"
}
empty_message(value) := msg if {
  not is_empty(value)
  msg := ""
}

# Range checks
test_value_range(range_values, value) if {
  test_lower_range(range_values, value)
  test_upper_range(range_values, value)
}

test_lower_range(range_values, value) if {
  is_null(range_values.lower_bound)
}
test_lower_range(range_values, value) if {
  not is_null(range_values.lower_bound)
  value >= range_values.lower_bound
}

test_upper_range(range_values, value) if {
  is_null(range_values.upper_bound)
}
test_upper_range(range_values, value) if {
  not is_null(range_values.upper_bound)
  value <= range_values.upper_bound
}

# Accept null or number
is_null_or_number(value) if {
  is_null(value)
}
is_null_or_number(value) if {
  type_name(value) == "number"
}

# Extract a key from array of objects
get_value_from_array(arr, key) := value if {
  some i
  obj := arr[i]
  obj[key] != null
  value := obj[key]
}

# Check if a set is empty and return default message
check_empty_set(set, msg) := ret if {
  count(set) == 0
  ret := [msg]
}
check_empty_set(set, msg) := ret if {
  count(set) != 0
  ret := set
}

# Case-insensitive "starts with"
name_starts_with(name, prefix) if {
  startswith(lower(name), lower(prefix))
}
