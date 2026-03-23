package terraform.gcp.helpers

get_resource_name(this_nc_resource, value_name) = resource_name if {
    this_nc_resource.values[value_name] 
    resource_name := this_nc_resource.values[value_name]
} else = resource_name if {
    resource_name := this_nc_resource[value_name]
} else = null if {
    print(sprintf("Resource name for '%s' was not found! Your 'resource_value_name' in vars is wrong. Try 'resource_value_name': 'name'.", [this_nc_resource.type]))
}

# for resource filtering
resource_type_match(resource, resource_type) if {
    resource.type == resource_type
}

# returns all resouce blocks in json plan of given type
get_all_resources(resource_type) = resources if
{    
    resources := [
        resource |        
        resource := input.planned_values.root_module.resources[_]         
        resource_type_match(resource, resource_type)     
    ] 
}

# extract policy type
get_policy_type(chosen_type) = policy_type if {
    policy_type := policy_types[_]
    policy_type == chosen_type
}

# returns workable string for Rego's object.get()
format_attribute_path(attribute_path) = string_path if {
    is_array(attribute_path)
    string_path := concat(".", get_attribute_path(attribute_path))
}

format_attribute_path(attribute_path) = string_path if {
    is_string(attribute_path)
    string_path := replace(attribute_path, "_", " ")
}

# converts given attribute path into workable string for Rego's object.get()
get_attribute_path(attribute_path) = result if {
    is_array(attribute_path)
    result := [ val |
        x := attribute_path[_]
        val := convert_value(x)
  ]
}

# converts values from an int to a string but leaves strings as is
convert_value(x) = string if {
  type_name(x) == "number"
  string := sprintf("[%v]", [x])
}

convert_value(x) = x if {
  type_name(x) == "string"
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

# checks if value is empty space
is_empty(value) if {
    value == ""
}

get_value_from_array(arr, key) = value if {
    some i
    obj := arr[i]
    obj[key] != null
    value := obj[key]
}

# checks if a set is empty and returns a message if it is
check_empty_set(set,msg) = return if {
    count(set) == 0
    return := [msg]
}
check_empty_set(set,msg) = return if {
    count(set) != 0
    return := set
}

intersection_all(sets) = result if {
    result = {x |
        x = sets[0][_]
        all_other := [s | s := sets[_]]
        every s in all_other { x in s }
    }
}

get_multi_summary(situations, variables) = summary if { 
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
        condition := situation[_] 
        condition_name := condition.condition
        attribute_path := condition.attribute_path
        values := condition.values
        pol := lower(condition.policy_type)
        pol == get_policy_type(pol) 
        values_formatted = array_check(values)
        msg := {condition_name : select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, pol, value_name)}
    ]
    sd := get_value_from_array(situation,"situation_description")
    remedies := get_value_from_array(situation,"remedies")
    violations := {
        "situation_description": sd,
        "remedies": remedies,
        "all_conditions": messages 
    }
}

process_violations(violations) = situation_summary if {
    # in each set of rules, get each unique nc resource name and each violation message
    situation := [
        {sit_desc : {"remedies": remedies, "conds": conds}} |
        this_sit := violations[_]
        sit_desc := this_sit.situation_description
        remedies := this_sit.remedies
        conds := this_sit.all_conditions
    ]

    # create a set containing only the nc resource for each situation
    resource_sets :=  [ {sit_desc : resource_set} |
        this_sit := situation[_]
        some key, val in this_sit
        sit_desc := key
        this_condition := val.conds
        resource_set := [nc | 
            some keyy, vall in this_condition[_]
            nc := {x | x := vall[_].name}]
    ]

    # implements AND logic per situation
    overall_nc_resources := [ {sit_desc : intersec} | 
        this_set := resource_sets[_]
        some key, val in this_set
        sit_desc := key
        intersec := intersection_all(val)
    ]

    # final formating
    resource_message := [ {sit : msg} | 
        some key, val in overall_nc_resources[_]
        sit := key
        msg := check_empty_set(val, "All passed")
    ]

    # operate per situation: returns the entire details
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

policy_types := ["blacklist", "whitelist", "range", "pattern blacklist", "pattern whitelist"]

# ***** Entry Function *****
get_blacklisted_resources(resource_type, attribute_path, blacklisted_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        array_contains(blacklisted_values, object.get(resource.values, attribute_path, null), "blacklist")
    ]
}

# if single element (function name: Bl1)
array_contains(arr, elem, pol) if {
    not is_array(elem)
    arr[_] == elem
}

# if array (function name: Bl2)
array_contains(arr, elem, pol) if {
    is_array(elem)
    pol == "blacklist"
    arr_to_set = {x | x := arr[_]}
    elem_to_set = {x | x := elem[_]}
    count(arr_to_set & elem_to_set) > 0
}

# iterates through given set of resources, applies Bl functions to each
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

# displays non-compliant message for given non-compliant resources
format_blacklist_message(friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values) = msg if {
        msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. This is blacklisted: %v",
        [friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values]
        ) 
}

# ***** Entry Function *****
get_nc_whitelisted_resources(resource_type, attribute_path, compliant_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        # Test array of array and deeply nested values
        not array_contains(compliant_values, object.get(resource.values, attribute_path, null), "whitelist")
    ]
}

# if single element (function name: Wl1)
array_contains(arr, elem, pol) if {
    not is_array(elem)
    arr[_] == elem
}

# if array (function name: Wl2)
array_contains(arr, elem, pol) if {
    is_array(elem)
    pol == "whitelist"
    arr_to_set = {x | x := arr[_]}
    elem_to_set = {x | x := elem[_]}
    object.subset(arr_to_set, elem_to_set)
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

format_whitelist_message(friendly_resource_name, resource_value_name, string_path, nc_value, empty, compliant_values) = msg if {
    msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. Expected values: %v",
        [friendly_resource_name, resource_value_name, string_path, nc_value, empty, compliant_values]
    )
}

# ***** Entry Function *****
get_nc_range_resources(resource_type, attribute_path, range_values) = resources if {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        not test_value_range(range_values, to_number(object.get(resource.values, attribute_path, null)))
    ]
}

test_value_range(range_values, value) if {
    test_lower_range(range_values, value)
    test_upper_range(range_values, value)
}

# ***** Lower bound checks *****
test_lower_range(range_values,value) = true if {
    # Check value exists
    not is_null(range_values.lower_bound)
    value >= range_values.lower_bound
}

# null indicates no higher bound
test_lower_range(range_values,value) = true if {
    is_null(range_values.lower_bound)
}

# ***** Upper bound checks *****
test_upper_range(range_values,value) = true if {
    # Check value exists
    not is_null(range_values.upper_bound)
    value <= range_values.upper_bound
}

# null indicates no higher bound
test_upper_range(range_values,value) = true if {
    is_null(range_values.upper_bound)
}

get_range_violations(resource_type, attribute_path, range_values, friendly_resource_name, value_name) = results if {
    unpacked_range_values = range_values
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

format_range_validation_message(friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, range_values) = msg if {
    upper_bound := get_upper_bound(range_values)
    lower_bound := get_lower_bound(range_values)
    msg := sprintf(
        "%s '%s' has '%s' set to '%s'%s. It should be set between '%s and %s'.",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, lower_bound, upper_bound]
    ) 
}

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

# returns a list of the found values based on a given pattern
get_target_list(resource, attribute_path, target) = target_list if {
    p := regex.replace(target, "\\*", "([^/]+)")
    target_value := object.get(resource.values, attribute_path, null) 
    matches := regex.find_all_string_submatch_n(p, target_value, 1)[0]
    target_list := array.slice(matches, 1, count(matches))
} else := "Wrong pattern"

# iterates through target list and given disallowed/allowed patterns
get_nc_pattern_blacklist(resource, attribute_path, target, patterns) = ncc if {
    target_list = get_target_list(resource, attribute_path, target)
    ncc := [
        {"value": target_list[i], "allowed": patterns[i]} | 
            some i
            array_contains(patterns[i], target_list[i], "blacklist")
    ]
}

# returns the non-compliant resources where a disallowed value was found
get_nc_pattern_blacklist_resources(resource_type, attribute_path, values) = resources if {
    resources := [
        resource |
        target := values[0] 
        patterns := values[1] 
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        count(get_nc_pattern_blacklist(resource, attribute_path, target, patterns)) > 0 
    ]
}

get_pattern_blacklist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name) = results if {
    string_path := format_attribute_path(attribute_path)
    results := 
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

final_formatter(target, sub_pattern) = final_format if {
    final_format := regex.replace(target, sub_pattern, sprintf("'%s'", [sub_pattern]))
}

# iterates through target list and given allowed patterns
get_nc_pattern_whitelist(resource, attribute_path, target, patterns) = ncc if {
    target_list = get_target_list(resource, attribute_path, target)
    ncc := [
        {"value": target_list[i], "allowed": patterns[i]} |
            some i
            not array_contains(patterns[i], target_list[i], "whitelist")
    ]
}

# returns the non-compliant resources where value doesn't match allowed patterns
get_nc_pattern_whitelist_resources(resource_type, attribute_path, values) = resources if {
    resources := [
        resource |
        target := values[0]
        patterns := values[1]
        resource := input.planned_values.root_module.resources[_]
        resource_type_match(resource, resource_type)
        count(get_nc_pattern_whitelist(resource, attribute_path, target, patterns)) > 0
    ]
}

get_pattern_whitelist_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name) = results if {
    string_path := format_attribute_path(attribute_path)
    results :=
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
        "%s '%s' has '%s' set to '%s'%s. Expected pattern: %s",
        [friendly_resource_name, resource_value_name, attribute_path_string, nc_value, empty, allowed_values]
    )
}

# helper to check if value is an array
array_check(value) = result if {
    is_array(value)
    result := value
} else = result if {
    result := [value]
}

# helper to format range inputs
format_range_input(lower, upper) = range if {
    range := {
        "lower_bound": lower,
        "upper_bound": upper
    }
}