package terraform.gcp.security.analytics_hub.data_exchange.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (simple: display_name must start with prefix)
conditions := [
    [
        {"situation_description" : "Data Exchange display_name must start with the defined prefix",
        "remedies":[ 
            "Rename the Data Exchange so that its display_name starts with the required prefix", 
            "Update your Terraform resource to include the prefix from vars.prefix"
        ]},
        {
            "condition": "Check if display_name starts with the allowed prefix",
            "attribute_path" : ["display_name"], 
            "values" : [vars.prefix], 
            "policy_type" : "pattern whitelist"
        }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.analytics_hub.data_exchange.naming_standard.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.analytics_hub.data_exchange.naming_standard.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
