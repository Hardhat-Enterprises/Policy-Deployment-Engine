package terraform.gcp.security.clouddns.dns_policy.enable_inbound_forwarding # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Enable inbound forwarding",
    "remedies":[ "Disallows inbound forwarding"]},
    {
        "condition": "Inbound forwarding is false",
        "attribute_path" : ["enable_inbound_forwarding"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [], # Values to compare against
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