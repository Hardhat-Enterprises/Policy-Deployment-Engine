package terraform.gcp.helpers

# Defines the types of policies capable of being processed
policy_types := ["blacklist", "whitelist", "range", "pattern blacklist", "pattern whitelist"]

####################################################

# NEW FUNCTIONS

# Get resource's name; if not in values, take default "name". Checked!
get_resource_name(this_nc_resource, value_name) = resource_name if
{
    resource_name := this_nc_resource.values[value_name]
}

get_resource_name(this_nc_resource, value_name) = resource_name if
{
    resource_name := this_nc_resource[value_name] # i.e., vars.rego: "resource_value_name": "name"
}

# if elem is an array; checks if elem contains any blacklisted items. e.g., elem=[w, r, a], arr=[a] -> true
array_contains(arr, elem, pol) if {
    is_array(elem)
    pol == "blacklist"
    #print(sprintf("%s", ["bb"]))
    arr_to_set = {x | x := arr[_]}
    elem_to_set = {x | x := elem[_]}
    count(arr_to_set & elem_to_set) > 0
}

# if elem is an array; checks if elem is at least a subset of arr. e.g., elem=[write, read], arr=[read, write, eat] -> true
array_contains(arr, elem, pol) if {
    is_array(elem)
    pol == "whitelist"
    #print(sprintf("%s", ["ww"]))
    arr_to_set = {x | x := arr[_]}
    elem_to_set = {x | x := elem[_]}
    object.subset(arr_to_set, elem_to_set)
}

# Generic helper functions:

# Helper: Check if value exists in array
array_contains(arr, elem, pol) if {
    not is_array(elem)
    #print(sprintf("%s", ["a2"]))
    arr[_] == elem
}

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
# Extract policy type
get_policy_type(chosen_type) = policy_type if {
    policy_type := policy_types[_]
    policy_type == chosen_type
}

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
format_attribute_path(attribute_path) = string_path if {
    is_array(attribute_path)
    string_path := concat(".", get_attribute_path(attribute_path))
}
format_attribute_path(attribute_path) = string_path if {
    is_string(attribute_path)
    string_path := replace(attribute_path, "_", " ")
}
array_check(values) = result if {
    type := type_name(values)
    type != "array"
    result := [values]
}
array_check(values) = result if {
    type := type_name(values)
    type == "array"
    result := values
}

# Check if value is empty space
is_empty(value) if {
    value == ""
}

# empty_message: if empty, return fomratted warning
empty_message(value) = msg if {
    is_empty(value)
    msg = " (!!!EMPTY!!!)"
}

# empty_message: if present, return nothing (space)
empty_message(value) = msg if {
    not is_empty(value)
    msg = ""
}

#Checks a value sits between a given range of a passed object with keys upper_bound and lower_bound

test_value_range(range_values, value) if {
    test_lower_range(range_values, value)
    test_upper_range(range_values, value)
}

test_lower_range(range_values,value) = true if {
    # Check value exists
    not is_null(range_values.lower_bound)
    value >= range_values.lower_bound
}

# Null indicates no lower bound
test_lower_range(range_values,value) = true if {
    is_null(range_values.lower_bound)
}

test_upper_range(range_values,value) = true if {
    # Check value exists
    not is_null(range_values.upper_bound)
    value <= range_values.upper_bound
}

# Null indicates no higher bound
test_upper_range(range_values,value) = true if {
    is_null(range_values.upper_bound)
}

is_null_or_number(value) if {
    is_null(value)  # true if value is null
}

is_null_or_number(value) if {
    type_name(value) == "number"  # true if value is a number
}

# Search an array of objects for a specific key, return the value
get_value_from_array(arr, key) = value if {
    some i
    obj := arr[i]
    obj[key] != null
    value := obj[key]
}

# Checks if a set is empty and returns a message if it is
check_empty_set(set,msg) = return if {
    count(set) == 0
    return := [msg]
}
check_empty_set(set,msg) = return if {
    count(set) != 0
    return := set
}

####################################################

# Entry point for all policies 
get_multi_summary(situations, variables) = summary if { # Samira , Patrick
    # Unpack values from vars
    resource_type := variables.resource_type
    friendly_resource_name := variables.friendly_resource_name
    value_name := variables.resource_value_name
    all_resources := get_all_resources(resource_type)
    violations := check_violations(resource_type, situations, friendly_resource_name, value_name)
    violations_object := process_violations(violations)
    formatted_message := format_violations(violations_object)
    summary := {
        "message": array.concat(
            [sprintf("Total %s detected: %d ", [friendly_resource_name, count(all_resources)])],
            formatted_message
        ),
        "details": violations_object
    }
} else := "Policy type not supported."

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[0] # Blacklist
    results := get_blacklist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[1] # Whitelist
    results := get_whitelist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[2] # Range (Upper and lower bounds)
    values_formatted_range := format_range_input(values_formatted[0], values_formatted[1])
    results := get_range_violations(resource_type, attribute_path, values_formatted_range, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[3] # Patterns (B)
    results := get_pattern_blacklist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[4] # Patterns (W)
    results := get_pattern_whitelist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

check_violations(resource_type, situations, friendly_resource_name, value_name) = violations if {
    some i
    violations := [
        msg |
        msg := check_conditions(resource_type, situations[i], friendly_resource_name, value_name)
    ]
}

check_conditions(resource_type, situation, friendly_resource_name, value_name) = violations if {
        messages := [
        msg |
        condition := situation[_] # per cond
        condition_name := condition.condition
        attribute_path := condition.attribute_path
        values := condition.values
        pol := lower(condition.policy_type)
        pol == get_policy_type(pol) # checks, leads to else
        values_formatted = array_check(values)
        msg := {condition_name : select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, pol, value_name)} # all in
    ]
    sd := get_value_from_array(situation,"situation_description")
    remedies := get_value_from_array(situation,"remedies")
    violations := {
        "situation_description": sd,
        "remedies": remedies,
        "all_conditions": messages #[{c1 : [{msg, nc}, {msg, nc}, ...]}, {c2 :[{msg, nc}, ...]}, ... : [...], ...}]
    }
}

process_violations(violations) = situation_summary if {
    # In each set of rules, get each unique nc resource name and each violation message
    situation := [
        {sit_desc : {"remedies": remedies, "conds": conds}} |
        this_sit := violations[_]
        sit_desc := this_sit.situation_description
        remedies := this_sit.remedies
        conds := this_sit.all_conditions
    ]

    # There is an issue here if you use the same situation description however that shouldn't happen

    # Create a set containing only the nc resource for each situation
    resource_sets :=  [ {sit_desc : resource_set} |
        this_sit := situation[_]
        some key, val in this_sit
        sit_desc := key
        this_condition := val.conds
        resource_set := [nc | 
            some keyy, vall in this_condition[_]
            nc := {x | x := vall[_].name}]
    ]

    overall_nc_resources :=[ {sit_desc : intersec} | 
        this_set := resource_sets[_]
        some key, val in this_set
        sit_desc := key
        intersec := intersection_all(val)
    ]

    resource_message := [ {sit : msg} | # USE THIS
        some key, val in overall_nc_resources[_]
        sit := key
        msg := check_empty_set(val, "All passed")
    ]
    # PER SITUATION

    situation_summary := [ summary |
        this_sit := situation[_]
        some key, val in this_sit
        sit_name := key
        details := val.conds
        remedies := val.remedies
        nc_all := object.get(resource_message[_], sit_name, null)
        nc_all != null

        summary := {
            "situation" : sit_name,
            "remedies" : remedies,
            "non_compliant_resources" : nc_all,
            "details" : details
        }
    ]

} 

format_violations(violations_object) = formatted_message if {
    formatted_message := [
        [ sd, nc, remedies] |
        some i 
        this_sit := violations_object[i]
        sd := sprintf("Situation %d: %s",[i+1, this_sit.situation])
        resources_value := [value | 
        value := this_sit.non_compliant_resources[_]
        ]
        nc := sprintf("Non-Compliant Resources: %s", [concat(", ", resources_value)])
        remedies := sprintf("Potential Remedies: %s", [concat(", ", this_sit.remedies)])
    ]
}

intersection_all(sets) = result if {
    result = {x |
        x = sets[0][_]
        all_other := [s | s := sets[_]]
        every s in all_other { x in s }
    }
}
####################################################

# Policy type specific methods

# Each policy type needs the following:
# 1. A method that formats the error message to be displayed for a non-compliant value
# 2. A method that obtains non-complaint resources
# 3. A method that calls method to obtain nc resources and for each calls the format method

# Blacklist methods

get_blacklisted_resources(resource_type, attribute_path, blacklisted_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        # Test array of array and deeply nested values
        array_contains(blacklisted_values, object.get(resource.values, attribute_path, null), "blacklist")
    ]
}

get_blacklist_violations(resource_type, attribute_path, blacklisted_values, friendly_resource_name, value_name) = results if {
    string_path := format_attribute_path(attribute_path)
    results := 
    [ { "name": get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := get_blacklisted_resources(resource_type, attribute_path, blacklisted_values)
    this_nc_resource = nc_resources[_]
    this_nc_attribute = object.get(this_nc_resource.values, attribute_path, null)
    msg := format_blacklist_message(friendly_resource_name, get_resource_name(this_nc_resource, value_name), string_path, this_nc_attribute, empty_message(this_nc_attribute), blacklisted_values)
    ]
}

format_blacklist_message(friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values) = msg if {
        msg := sprintf(
        #Change message however we want it displayed
        "%s '%s' has '%s' set to '%v'%s. This is blacklisted: %v",
        [friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values]
        ) 
}
####################################################
# Whitelist methods

format_whitelist_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, compliant_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. It should be set to '%v'",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, compliant_values]
    ) 
}

get_nc_whitelisted_resources(resource_type, attribute_path, compliant_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        # Test array of array and deeply nested values
        not array_contains(compliant_values, object.get(resource.values, attribute_path, null), "whitelist")
    ]
}

get_whitelist_violations(resource_type, attribute_path, compliant_values, friendly_resource_name, value_name) = results if {
    string_path := format_attribute_path(attribute_path)
    results := 
    [ { "name": get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := get_nc_whitelisted_resources(resource_type, attribute_path, compliant_values)
    this_nc_resource = nc_resources[_]
    this_nc_attribute = object.get(this_nc_resource.values, attribute_path, null)
    msg := format_whitelist_message(friendly_resource_name, get_resource_name(this_nc_resource, value_name), string_path, this_nc_attribute, empty_message(this_nc_attribute), compliant_values)
    ]
}

####################################################
# Range methods

get_upper_bound(range_values) = bound if {
    not is_null(range_values.upper_bound)
    bound := sprintf("%v", [range_values.upper_bound])
}
get_upper_bound(range_values) = "Inf" if {
    is_null(range_values.upper_bound)
}

get_lower_bound(range_values) = bound if {
    not is_null(range_values.lower_bound)
    bound := sprintf("%v", [range_values.lower_bound])
}
get_lower_bound(range_values) = "-Inf" if {
    is_null(range_values.lower_bound)
}

format_range_validation_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, range_values) = msg if {
    upper_bound := get_upper_bound(range_values)
    lower_bound := get_lower_bound(range_values)
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'%s. It should be set between '%s and %s'.",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, lower_bound, upper_bound]
    ) 
}

get_nc_range_resources(resource_type, attribute_path, range_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        # Test array of array and deeply nested values
        not test_value_range(range_values, to_number(object.get(resource.values, attribute_path, null)))
    ]
}

get_range_violations(resource_type, attribute_path, range_values, friendly_resource_name, value_name) = results if {
    unpacked_range_values = range_values #[0] <===================================================================== removed [0] - Visal
    string_path := format_attribute_path(attribute_path)
    results := 
    [ { "name": get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := get_nc_range_resources(resource_type, attribute_path, unpacked_range_values)
    this_nc_resource = nc_resources[_]
    this_nc_attribute = object.get(this_nc_resource.values, attribute_path, null) 
    msg := format_range_validation_message(friendly_resource_name, get_resource_name(this_nc_resource, value_name), string_path, this_nc_attribute, empty_message(this_nc_attribute), unpacked_range_values)
    ]
}

format_range_input(lower,upper) = range_values if {
    is_null_or_number(lower)
    is_null_or_number(upper)
    range_values := {"lower_bound":lower,"upper_bound":upper}
}

############### REGEX

# HELPER: gets the target * pattern
get_target_list(resource, attribute_path, target) = target_list if {
    p := regex.replace(target, "\\*", "([^/]+)")
    #print(sprintf("SSSSSSSSSSSSSSSSSSSSound %s", [p]))
    target_value := object.get(resource.values, attribute_path, null) 
    matches := regex.find_all_string_submatch_n(p, target_value, 1)[0] # all matches, including main string
    target_list := array.slice(matches, 1, count(matches)) # leaves every single * match except main string
    #print(sprintf("SSSSSSSSSSSSSSSSSSSSound %s", [target_list]))
} else := "Wrong pattern"

final_formatter(target, sub_pattern) = final_format if {
    final_format := regex.replace(target, sub_pattern, sprintf("'%s'", [sub_pattern]))
}

# PATTERN BLACKLIST
get_nc_pattern_blacklist(resource, attribute_path, target, patterns) = ncc if {
    target_list = get_target_list(resource, attribute_path, target) # list of targetted substrings
    ncc := [
        {"value": target_list[i], "allowed": patterns[i]} | 
            some i
            array_contains(patterns[i], target_list[i], "blacklist") # direct mapping of positions of target * with its list of allowed patterns
    ]
}

get_nc_pattern_blacklist_resources(resource_type, attribute_path, values) = resources if {
    resources := [
        resource |
        target := values[0] # target val string
        patterns := values[1] # allowed patterns (list)
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        count(get_nc_pattern_blacklist(resource, attribute_path, target, patterns)) > 0 # ok, there is a resource with at least one non-compliant
    ]
}

get_pattern_blacklist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name) = results if {
    string_path := format_attribute_path(attribute_path)
    results := # and their patterns 
    [ { "name": get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := get_nc_pattern_blacklist_resources(resource_type, attribute_path, values_formatted)
    this_nc_resource = nc_resources[_]
    nc := get_nc_pattern_blacklist(this_nc_resource, attribute_path, values_formatted[0], values_formatted[1])
    this_nc := nc[_]
    msg := format_pattern_blacklist_message(friendly_resource_name, get_resource_name(this_nc_resource, value_name), string_path, final_formatter(object.get(this_nc_resource.values, attribute_path, null), this_nc.value), empty_message(this_nc.value), this_nc.allowed)
    ]
}

format_pattern_blacklist_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'%s. This is blacklisted: %s",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values]
    ) 
}

# PATTERN WHITELIST (clone of blacklist, but not array_contains()
get_nc_pattern_whitelist(resource, attribute_path, target, patterns) = ncc if {
    target_list = get_target_list(resource, attribute_path, target) # list of targetted substrings
    ncc := [
        {"value": target_list[i], "allowed": patterns[i]} | 
            some i
            not array_contains(patterns[i], target_list[i], "whitelist") # direct mapping of positions of target * with its list of allowed patterns
    ]
}

get_nc_pattern_whitelist_resources(resource_type, attribute_path, values) = resources if {
    resources := [
        resource |
        target := values[0] # target val string
        patterns := values[1] # allowed patterns (list)
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        count(get_nc_pattern_whitelist(resource, attribute_path, target, patterns)) > 0 # ok, there is a resource with at least one non-compliant
    ]
}

get_pattern_whitelist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name) = results if {
    string_path := format_attribute_path(attribute_path)
    results := # and their patterns 
    [ { "name": get_resource_name(this_nc_resource, value_name),
        "message": msg
    } |
    nc_resources := get_nc_pattern_whitelist_resources(resource_type, attribute_path, values_formatted)
    this_nc_resource = nc_resources[_]
    nc := get_nc_pattern_whitelist(this_nc_resource, attribute_path, values_formatted[0], values_formatted[1])
    this_nc := nc[_]
    msg := format_pattern_whitelist_message(friendly_resource_name, get_resource_name(this_nc_resource, value_name), string_path, final_formatter(object.get(this_nc_resource.values, attribute_path, null), this_nc.value), empty_message(this_nc.value), this_nc.allowed)
    ]
}

format_pattern_whitelist_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'%s. It should be set to one of: %s",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values]
    ) 
}
