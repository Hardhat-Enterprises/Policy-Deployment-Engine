package terraform.gcp.security.scc.project_custom_module.enablement_state
import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.project_custom_module.vars


# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "enablement_state must be ENABLE",
    "remedies":[ "enablement_state in project custom module should be ENABLED"]},
    {
        "condition": "Check if the resource is in a specific state",
        "attribute_path" : ["enablement_state"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["ENABLED"], # Values to compare against
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
