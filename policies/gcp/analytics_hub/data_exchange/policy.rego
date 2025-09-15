package terraform.gcp.security.analytics_hub.data_exchange.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE
# STEP 2: CREATE SCENARIOS (conditions to enforce naming standards)

conditions := [
    [
        {
            "situation_description" : "Data Exchange display_name must start with the prefix 'de-'",
            "remedies":[ 
                "Rename the Data Exchange so that its display_name starts with 'de-'", 
                "Update your Terraform resource to include the correct prefix"
            ]
        },
        {
            "condition": "Check if display_name starts with the allowed prefix",
            "attribute_path" : ["display_name"], 
            "values" : ["de-"], 
            "policy_type" : "pattern whitelist"
        }
    ],
    [
        {
            "situation_description" : "Data Exchange ID must only contain lowercase letters, numbers, or underscores",
            "remedies":[ 
                "Update the data_exchange_id to use only lowercase letters, numbers, and underscores",
                "Avoid uppercase letters, spaces, or special characters"
            ]
        },
        {
            "condition": "Check if data_exchange_id follows allowed character pattern",
            "attribute_path" : ["data_exchange_id"], 
            "values" : ["^[a-z0-9_]+$"], 
            "policy_type" : "pattern whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance to every condition
details := helpers.get_multi_summary(conditions, vars.variables).details
