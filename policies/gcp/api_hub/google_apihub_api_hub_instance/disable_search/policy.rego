package terraform.gcp.security.api_hub.google_apihub_api_hub_instance.disable_search

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Resource disable_search is not compliant.",
    "remedies":[ "Set disable_search to TRUE only"]},
    {
        "condition": "Check if disable_search is set to TRUE",
        "attribute_path" : ["config", "disable_search"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["true"], # Values to compare against
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