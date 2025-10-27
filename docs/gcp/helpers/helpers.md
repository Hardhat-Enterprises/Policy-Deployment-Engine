# terraform.gcp.helpers Documentation

**Tested on:** OPA Version 1.2.0, Rego Version v1<br>
**Purpose:** Provides helper functions for GCP Terraform compliance policies, including resource handling, array checks, attribute formatting, range tests, and empty value handling.

## 
**Last updated:** 21 September 2025 (T2 2025)<br>
**By:** Visal Dam

---
## Table of Contents

1. [Architecture](#architecture)  
2. [Utility Functions](#utility-functions)
3. [Entry Functions](#entry-functions)
4. [Policy Types](#policy-types) 
5. [Tips](#tips) 
6. [Development Team](#development-team)
---

## Architecture
The helpers is built on Rego, which is a declarative language. Hence, development is very different compared to popular functional langauges.

In a declarative language, think of functions as being built out of conditions which are all assumed true. If any condition is not, then the function does not execute any further.

Development of the helpers should be backwards-compatible. All new features should ensure that previously-made policies remain supported - unless you come across something far too critical. 

Our policies check for non-compliance. When a condition or situation is "triggered", it means that the resource(s) - and by extension the entire configuration - is non-compliant. 

Our policies assess only values that are prone to misconfiguration. This is the main objective of the PDE. This means that values that are not allowed Terraform are irrelevant; otherwise, they would not be generated in the json plan in the firt place. For example, consider the attribute "number_of_cpus", which should take integer values by default. Hence, policies or methods to check if the input is a string is irrelevant.

## Utility Functions
### get_resource_name()
```rego
get_resource_name(this_nc_resource, value_name) = resource_name if {
    this_nc_resource.values[value_name] 
    resource_name := this_nc_resource.values[value_name]
} else = resource_name if {
    resource_name := this_nc_resource[value_name]
} else = null if {
    print(sprintf("Resource name for '%s' was not found! Your 'resource_value_name' in vars is wrong. Try 'resource_value_name': 'name'.", [this_nc_resource.type]))
}
```
#### Notes
Likely to be depreceated - just have all resources collected by resource_name, set to c1, c2, ..., nc1, nc2, ... etc.

### resource_type_match()
```rego
# for resource filtering
resource_type_match(resource, resource_type) if {
    resource.type == resource_type
}
```
#### Notes
A json plan may contain multiple resources. This function ensures that only the resources of interest are collected.

### get_all_resources()
```rego
# returns all resouce blocks in json plan of given type
get_all_resources(resource_type) = resources if
{    
    resources := [
        resource |        
        resource := input.planned_values.root_module.resources[_]         
        resource_type_match(resource, resource_type)     
    ] 
}
```
#### Notes
This returns all the resource blocks (their config values and attributes) in the json plan, based on their resource type.

### get_policy_type()
```rego
# extract policy type
get_policy_type(chosen_type) = policy_type if {
    policy_type := policy_types[_]
    policy_type == chosen_type
}
```
#### Notes
Simple array checker.

### Attribute Path Mapping
```rego 
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
```
#### Notes
N/A

### Presence Checks()
```rego
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
```
#### Notes
Checks if assessed value is empty. Integrable functions where it is added by default to all messages to be formatted. If empty, displays warning. If not, leaves as is.

### get_value_from_array()
```rego
get_value_from_array(arr, key) = value if {
    some i
    obj := arr[i]
    obj[key] != null
    value := obj[key]
}
```
#### Notes
N/A

### check_empty_set()
```rego
# checks if a set is empty and returns a message if it is
check_empty_set(set,msg) = return if {
    count(set) == 0
    return := [msg]
}
check_empty_set(set,msg) = return if {
    count(set) != 0
    return := set
}
```
#### Notes
N/A

### intersection_all()
```rego
intersection_all(sets) = result if {
    result = {x |
        x = sets[0][_]
        all_other := [s | s := sets[_]]
        every s in all_other { x in s }
    }
}
```
#### Notes
Custom intersection function, used in processing resource violations.

## Entry Functions

### Main
```rego
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
```
#### Notes
Unpacks the policy into its core components. Situtations have their descriptions, remedies, and conditions (as well as each condition's attribute paths, allowed/disallowed values, and policy types) extracted.

All resources of interest from the json plan are extracted. Then, we for each resource, we check for non-compliance at the situation level (check_violations() below). Remember that for a situation composed of multiple conditions c1, c2, ..., etc., all of the conditions must be triggered for the situation to be triggered. For a policy composed of multiple situations, any of those triggered situations will trigger the entire policy.

### Policy Selectors
<details>
<summary>select_policy_logic()</summary>

```rego
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
```
</details>

#### Notes
N/A

### check_violations()
```rego
check_violations(resource_type, situations, friendly_resource_name, value_name) = violations if {
    some i
    violations := [
        msg |
        msg := check_conditions(resource_type, situations[i], friendly_resource_name, value_name)
    ]
}
```
#### Notes
This function operates at the policy -> situation(s) level. For each situation (in the list of situations), we call check_conditions() below.

### check_conditions()
```rego
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
```
#### Notes
This function operates at the situation -> conditon(s) level. Here we enumerate each condition for a situation, extracting key components. We are now working on the condition level. We then apply policy logic depending on the policy type. We also format the inputs to expected forms. We collect all instances of non-compliance as "msg" dictionary objects, which contains the output non-compliance message for that specific condition.

Once all triggered conditions have been collected, they are returned and mapped to their corresponding situations in the "violations" dictionary object. I.e., this function returns all triggered conditions for a given situation. "all_conditions": [{c1 : [{msg, nc}, {msg, nc}, ...]}, {c2 :[{msg, nc}, ...]}, ... : [...], ...}] for the given situation.

### Processing Resource Violations
```rego
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
```
#### Notes
Finally, after each situation has their condition(s) assessed via check_conditions(), the "violations" dictionary object is filled for the entire policy, detailing all situations and their triggered conditions (if any). The main idea in process_violations() is to implement AND and OR logic.

situation := [...] returns a list of situations and their conditions. Consider a policy that contains two situations sit1 and sit2. They each have two conditions. For sit1, the same resources, nc1 and nc2, trigger both conditions. For sit2, nc1 triggers c1 but not nc2; and nc2 triggers c2 but not nc1.

Click each of the below to expand.

<details>
<summary>situation</summary>

```json
situation = [
    { 
        "sit1": {
            "remedies": "...",
            "conds": [
                {
                    "c1": [
                        {
                            "msg": "...",
                            "nc": "nc1"
                        },
                        {
                            "msg": "...",
                            "nc": "nc2"
                        },
                    ],
                    "c2": [
                        {
                            "msg": "...",
                            "nc": "nc1"
                        },
                        {
                            "msg": "...",
                            "nc": "nc2"
                        },
                    ],
                    ...other conditions (if any)
                }
            ]
        },
        "sit2": {
            "remedies": "...",
            "conds": [
                {
                    "c1": [
                        {
                            "msg": "...",
                            "nc": "nc1" // note how only nc1 here for c1
                        },
                    ],
                    "c2": [
                        {
                            "msg": "...",
                            "nc": "nc2" // note how only nc2 here for c2
                        },
                    ],
                    ...other conditions (if any)
                }
            ]
        },
        ...other situations (if any)
    }
]
```
The situations are evaluated and each of the conditions, triggered or otherwise, are listed alongside the non-compliant resource that triggered it.

</details>

<details>
<summary>overall_nc_resources</summary>

```json
overall_nc_resources = [
  {
    "sit1": ["nc1", "nc2"],
    "sit2": [] // empty, as both conditions must share the same nc resource(s)
  }
]
```

Afterwards, for each situation we perform an INTERSECTION operation for all of their conditions based on the non-compliant resource. We see that as both nc1 and nc2 are in c1 and c2, the overall non-compliant resource for this situation (after having triggered ALL of its conditions) are listed.

For sit2, as not all of the conditions share the same resource, the result from the INTERSECTION operation is empty.

</details>

<details>
<summary>resource_message</summary>

```json
resource_message: [
  {
    "sit1": ["c", "nc"]
  },
  {
    "sit2": ["All passed"]
  }
]
```

Finally, we structure the situations into individual blocks. For any empty sets, we simply assign the message "All passed".
</details>

<details>
<summary>situation_summary</summary>

```json
situation_summary: [
    {
        "non_compliant_resources": ["nc1", "nc2"],
        "remedies": ["..."],
        "situation": "sit1",
        "details": [
            {
                "c1": [
                    {
                        "message": "...",
                        "name": "nc1"
                    },
                    {
                        "message": "...",
                        "name": "nc2"
                    }
                ]
            },
            {
                "c2": [
                    {
                        "message": "...",
                        "name": "nc1"
                    },
                    {
                        "message": "...",
                        "name": "nc2"
                    }
                ]
            }
        ]
    },
    {
        "non_compliant_resources": ["All passed"],
        "remedies": ["..."],
        "situation": "sit2",
        "details": [
            {
                "c1": [
                    {
                        "message": "...",
                        "name": "nc1"
                    }
                ]
            },
            {
                "c2": [
                    {
                        "message": "...",
                        "name": "nc2"
                    }
                ]
            }
        ]
    },
]
```

Finally, we return the resources that are truly non-compliant per situation. In terms of resources, if all conditions in a situation are triggered, the sitaution is triggered; hence why sit2 results in "All passed" as both resources only triggered a single condition each. If any situation is triggered, then the policy as a whole is triggered; the config contains some non-compliant resource(s).

The above block is what is returned for engineers to view the inticate details of a triggered policy violation, namely, which specific condition was triggered and by which resource(s).
</details>

## Policy Types

```rego
policy_types := ["blacklist", "whitelist", "range", "pattern blacklist", "pattern whitelist"]
```

### Blacklisting
#### Checking
```rego
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
``` 
Blacklisting is the simplest policy, and two functions are used to support two main types of inputs: 

1) Single elements: consider an array of disallowed values, a = [1, 2, 3, 4, 5]. Given an element input, i = 3, Bl1 iterates through a, and if 3 is spotted, non-compliance is triggered.
2) Arrays: consider an array of disallowed values, a = [1, 2, 3, 4, 5]. Given an array input, i = [2, 5, 3] (order not important), Bl2 turns both into sets and applies the INTERSECTION (&) set operation. Any elements shared between the two is counted; if greater than 0, non-compliance is triggered.

These two functions are iteratively applied to each resource block in the json plan; the 'resource := input.planned_values.root_module.resources[_]' block goes through each resource dictionary block in the json plan under the planned_values -> root_module -> resources.

#### Collecting
```rego
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
```
get_blacklist_violations() iterates through the given json input of resource configs, applying the Bl functions to each. We begin with a list operation in rego to assign values to a dictionary: "name" and "msg". All non-compliant resources are collected based on what happens when the Bl functions are applied.

Then, for each of the non-compliant resources, we use Rego's object.get to get the non-compliant attribute. 
```rego
# displays non-compliant message for given non-compliant resources
format_blacklist_message(friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values) = msg if {
        msg := sprintf(
        "%s '%s' has '%s' set to '%v'%s. This is blacklisted: %v",
        [friendly_resource_name, resource_value_name, string_path, nc_value, empty, nc_values]
        ) 
}
```
Finally, we use the collected information to display an informative message, namely, that the detected value is non-compliant because it is listed in the array of disallowed values.

#### Notes
N/A

### Whitelisting
#### Checking
```rego
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
```

Whitelisting is the opposite of Blacklisting. It follows the exact opposite logic for single elements, but not for array elements.
1) Single elements: consider an array of allowed values, a = [1, 2, 3, 4, 5]. Given an element input, i = 3, Wl1 iterates through a. It seems that 3 is in the list, and thus the resource is compliant. The opposite is true for a different input, say, i = 6.
2) Arrays: consider an array of allowed values, a = [1, 2, 3, 4, 5]. Given an array input, i = [2, 5, 8], Wl2 converts them into sets and applies the SUBSET set operation. A resource is only compliant if i is a direct subset of a. In this case, while a and i share 2 and 5, i contains 8, which is not in a. Thus, non-compliant is triggered. If i = [5, 3, 2], then the resource is compliant as a and i share all elements in i.

#### Collecting
Same logic as in Blacklisting.

#### Notes
N/A

### Range
#### Checking
```rego
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
```

The Range policy type performs a seemingly simple purpose: to check that a given integer input i is within a certain range, defined by lower and upper bounds L and U, respectively; i.e., L <= i <= U. However, many utility sub-functions are needed to ensure that this purpose is met, namely, datatype checking and handling cases where a range is not defined as between two bounds, but rather (either) a min/max.

If L = 100 and U = 200, then i = 150 is compliant, however both i = 99 and i = 201 are non-compliant. To handle a minimum value for i, simply set L = 100 and U = null; thus any i >= 100 is compliant with no limits. Likewise, setting L = null and U = 100 means only i <= 100 is compliant with no limits.

#### Collecting
```rego
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
```

```rego
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
```

#### Notes 
N/A

### Patterns (Blacklisting & Whitelisting)
Note that Patterns Blacklist and Whitelist use the same pattern logic in get_target_list(), just treating non-compliance differently. Hence, we will only be discussing the Pattern Blacklist method.
#### Checking
```rego
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
        {"value": target_list[i], "allowed": patterns[i]} | # note: "allowed" should be "disallowed" here due to mistake from copying over
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
```
For a given pattern, get_target_list() first replaces all instances of the * character with the simple regex pattern ([^/]+), which is used for simple searches of all alpha-numerical-symbolic characters. For a given pattern P = a/\*/c/\*/e this creates the regex search for a/**([^/]+)**/c/**([^/]+)**/e. Then we simply find this pattern in the json; if the input string i = a/**b**/c/**d**/e, then we have a match. We strip off b and d into a 'target' list, which is returned. Note their positions.

Next, for a given array of arrays of disallowed patterns, get_nc_pattern_blacklist() simply checks, in order, whether or not the 'target' values are in the disallowed strings. Any value that fits is returned, alongside the pattern. So, consider the following array of array of disallowed patterns: A = [[array of patterns], [array of patterns]] = [[1, #, b], [2, e, %]]. Matching target_list[i] and A[i], we see that b is in [1, #, b], but that d is not in [2, e, %]. Hence, we have found a non-complaint value.

Finally, based on get_nc_pattern_blacklist(), the resulting non-complaint values are counted. Any one match (as we are blacklisting) will result in the count of values greater than 0. 
#### Collecting

```rego
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
```
Follows the same formatting logic as above. Returns all inputted and collected information to the user. Namely, each detected disallowed value is collected and displayed alongside the given disallowed pattern list for clarity.

#### Notes
1) The Pattern methods will only work as intended if the desired pattern to be checked exists. If you provide a pattern, say a/\*/d which is not found, then get_target_list() will fail. Hence, the Pattern method is meant for attributes whose values can be repeated often, such as compliant/non-compliant directory paths.
2) Due to (1), for other patterns, simply add a new situation (OR logic) to detect other patterns in your policies.

## Tips
### Debugging
When debugging custom functions, it is useful to print values as the function executes. This is done in Rego using sprintf().
```rego
print(sprintf("This is a custom message. val1: %v, val2: %v", [val1, val2]))
```
We add a print() to force it to show on output. Otherwise, sprintf() will only output results when the --explain=notes flag is used in the opa eval command. Notice how the values in the array maps to the formatted string. Make sure to comment them out before deployment.

Likewise, we use also use flags in the opa eval command for debugging:

```
--explain=fails
--explain=full
--explain=notes
```

We usually use --explain=fails when a policy fails to determine the root cause. The other two are not usually used. These flags will output the entire Rego execution process from function to function, so it can be overwhelming.

### Development
You should create a seperate workfolder for helpers development, mimicking the same file and folder structure as the PDE. 

You should commit changes to the helpers in dev in a seperate PR always! You can simply edit the contents of the helpers.rego file there. Do not publish changes to the helpers in your service PRs. Only the development team should be making changes to the helpers.

You should have your changes tested and looked at by others too, just in case. 

Changes and features should be backwards compatible, unless it is something truly critical. 

The OPA version is very important. Some members may have installed a version of OPA incompatible with the helper functions. Make sure everyone uses at least version 1.2.0+.

Do not be scared by how complex the helpers seem; that's just Rego being Rego. The functionalities are rather simple when decoupled into their core operations. 

Lastly, do not hesitate to come up with new features, functionalities, or problem-solving perspectives. If an idea is not currently supported by the current utility functions, create your own! Likewise, feel free to improve existing ones - just make sure they're backwards compatible. You do not have to stick with what has been layed down; rather, use them as a means to go forward.

Good luck, and have fun!

## Development Team
<!-- Feel free to add to this list, new devs! -->
Contributions from individuals to the helpers.rego across trimester iterations.

### T1 2025
VISAL DAM <br>
PATRICK STUART <br>
SAMIRA FALAHAZANDEHI

###  T2 2025
VISAL DAM <br>
PATRICK STUART <br>
SEBASTIAN EDGE

