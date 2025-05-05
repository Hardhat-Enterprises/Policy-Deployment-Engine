package terraform.gcp.security.scc.source.display_name
import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.source.vars


# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Diplay name length is less than 32 characters",
    "remedies":[ "The name must be no more than 32 characters long."]},
    {
        "condition": "Check if the display_name follows the length requirement",
        "attribute_path" : ["display_name"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [0,32], # Values to compare against
        "policy_type" : "range" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]


# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
