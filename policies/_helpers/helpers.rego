package terraform.helpers
# tested on OPA Version: 1.2.0, Rego Version: v1

# Defines the types of policies capable of being processed
policy_types := ["blacklist", "whitelist", "range", "pattern blacklist", "pattern whitelist", "element blacklist"]

import data.terraform.helpers.shared
import data.terraform.helpers.policies.blacklist
import data.terraform.helpers.policies.whitelist
import data.terraform.helpers.policies.range
import data.terraform.helpers.policies.pattern_blacklist
import data.terraform.helpers.policies.pattern_whitelist
import data.terraform.helpers.policies.element_blacklist

####################################################

# NEW FUNCTIONS



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
# resource_type_match(resource, resource_type) if {
#     resource.type == resource_type
# }

# Collect all relevant resources
get_all_resources(resource_type) = resources if
{
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
    ]
}
# Extract policy type
get_policy_type(chosen_type) = policy_type if {
    policy_type := policy_types[_]
    policy_type == chosen_type
}


################################################################################
# This code is used by policies to convert error messages from:
# ["status", 0, "restricted_services"] → "status.[0].restricted_services"all this code 
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
################################################################################


# This normalizes input values into an array it is only called once by 
# check_conditions in the line
# values_formatted = array_check(values)
# much more direct change this line to 
# array_values := ensure_array(values)

# array_check(values) = result if {
#     type := type_name(values)
#     type != "array"
#     result := [values]
# }
# array_check(values) = result if {
#     type := type_name(values)
#     type == "array"
#     result := values
# }

ensure_array(values) = values if {
    is_array(values)
}
ensure_array(values) = [values] if {
    not is_array(values)
}

################################################################################

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

###############################################################################

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
    results := blacklist.get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[1] # Whitelist
    results := whitelist.get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[2] # Range (Upper and lower bounds)
    results := range.get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[3] # Patterns (B)
    results := pattern_blacklist.get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[4] # Patterns (W)
    results := pattern_whitelist.get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
}

select_policy_logic(resource_type, attribute_path, values_formatted, friendly_resource_name, chosen_type, value_name) = results if {
    chosen_type == policy_types[5] # Element blacklist
    results := element_blacklist.get_violations(resource_type, attribute_path, values_formatted, friendly_resource_name, value_name)
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
        array_values := ensure_array(values)
        msg := {condition_name : select_policy_logic(resource_type, attribute_path, array_values, friendly_resource_name, pol, value_name)} # all in
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


