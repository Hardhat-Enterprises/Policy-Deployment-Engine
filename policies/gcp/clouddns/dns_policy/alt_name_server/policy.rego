package terraform.gcp.security.clouddns.dns_policy.alt_name_server # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {
            "situation_description" : "Alternative server",
            "remedies": ["Allows use of a single alternative server if needed"]
        },
        {
            "condition": "Use alt server if main is unavailable",
            "attribute_path" : ["alt_name_server"], # An array of strings and indicies eg. ["rsa",0,"key"]
            "values" : ["139.0.0.1"], # Values to compare against
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