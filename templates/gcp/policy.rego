package terraform.gcp.security.cloud_platform_service.google_folder.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description": "Folders must have deletion protection enabled",
     "remedies": ["Set deletion_protection = true to prevent accidental deletion"]},
    {
      "condition": "Require deletion_protection to be true",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]
 
```
    Examples
    Remove this in actual policies

    Whitelist like previous policies
    [
    {"situation_description" : "Resource is not using Linux",
    "remedies":[ "Change the OS to linux"]},
    {
        "condition": "Test if an OS is not Linux",
        "attribute_path" : ["parent"],
        "values" : ["Linux"],
        "policy_type" : "whitelist" 
    }
    ]

    Blacklist - Disallow the use of specific values

    [
    {"situation_description" : "Resource is using Linux",
    "remedies":[ "Change the OS from linux"]},
    {
        "condition": "Test if an OS is Linux",
        "attribute_path" : ["parent"],
        "values" : ["Linux"],
        "policy_type" : "blacklist" 
    }
    ]

    Range - Use with numeric data to set a minimum, maximum or range

    Minimum 
    [
    {"situation_description" : "Check if key is over 1000 bits",
    "remedies":[ "Enforce a key over 1000 bits"]},
    {
        "condition": "Test if key size is over 1000 bits",
        "attribute_path" : ["rsa",0,"key"],
        "values" : [1000,null],
        "policy_type" : "range" 
    }
    ]

    Maximum  
    [
    {"situation_description" : "Check if key is under 1000 bits",
    "remedies":[ "Enforce a key under 1000 bits"]},
    {
        "condition": "Test if key size is under 1000 bits",
        "attribute_path" : ["rsa",0,"key"],
        "values" : [null,1000],
        "policy_type" : "range" 
    }
    ]

    Range 
    [
    {"situation_description" : "Check if key is between 1000 and 2000 bits",
    "remedies":[ "Ensure key is 1000 to 2000 bits"]},
    {
        "condition": "Test if key size is within 1000 to 2000 bits",
        "attribute_path" : ["rsa",0,"key"],
        "values" : [1000,2000],
        "policy_type" : "range" 
    }
    ]

    Patterns

    Whitelist
    [
    {"situation_description" : "Check description fits a defined pattern",
    "remedies":[ "Fix description to fit pattern"]},
    {
        "condition": "Wrong description pattern",
        "attribute_path" : ["description"],
        "values" : ["project/*/gcp/*", [["a","c","d"],["b","d"]]], # Value to be compared
        "policy_type" : "pattern whitelist" # First value must be one of a,c,d. Second value must be one of b,d.
    }
    ]

    Blacklist
    [
    {"situation_description" : "Check description fits a defined pattern",
    "remedies":[ "Fix description to fit pattern"]},
    {
        "condition": "Wrong description pattern",
        "attribute_path" : ["description"],
        "values" : ["project/*", [["root"]], # Value to be compared
        "policy_type" : "pattern blacklist" # Can be any value but root
    }
    ]
```

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details

