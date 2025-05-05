package terraform.gcp.security.clouddns.dns_policy.enable_logging  # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Allows a user to log in",
    "remedies":[ "user login rules"]},
    {
        "condition": "login = true",
        "attribute_path" : ["enable_logging"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [true], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
   

message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details