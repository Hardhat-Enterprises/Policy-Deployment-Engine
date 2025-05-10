package terraform.gcp.security.scc.mute_config.type
import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.mute_config.vars


# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Type in mute_config should be one of the accpected values",
    "remedies":[ "Type in mute_config should be on of MUTE_CONFIG_TYPE_UNSPECIFIED, STATIC and DYNAMIC"]},
    {
        "condition": "Check if the type is in a specific state",
        "attribute_path" : ["type"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["MUTE_CONFIG_TYPE_UNSPECIFIED","STATIC", "DYNAMIC" ], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
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
