package terraform.gcp.security.analytics_hub.data_exchange_iam.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_iam.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (simple: data_exchange_id must start with prefix)
conditions := [
    [
        {
            "situation_description": "IAM Data Exchange IDs must start with the required prefix",
            "remedies": [
                "Update the data_exchange_id to begin with the defined prefix",
                "Modify Terraform configuration to enforce naming convention"
            ]
        },
        {
            "condition": "Check if data_exchange_id starts with the allowed prefix",
            "attribute_path": ["data_exchange_id"],
            "values": [sprintf("^%s.*", [vars.variables.prefix])], # regex enforces prefix
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance
details := helpers.get_multi_summary(conditions, vars.variables).details
