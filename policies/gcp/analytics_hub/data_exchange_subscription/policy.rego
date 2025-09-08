package terraform.gcp.security.analytics_hub.data_exchange_subscription.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_subscription.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS
conditions := [
    [
        {
            "situation_description": "Subscription ID must follow lowercase alphanumeric with underscores",
            "remedies": [
                "Rename subscription_id to only contain lowercase letters, digits, and underscores",
                "Update Terraform config to enforce valid subscription_id naming"
            ]
        },
        {
            "condition": "Check if subscription_id matches required regex",
            "attribute_path": ["subscription_id"],
            "values": ["^[a-z0-9_]+$"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Subscription must be deployed only in allowed regions",
            "remedies": [
                "Restrict region to one of the approved regions in vars.allowed_regions",
                "Update Terraform resource to use a valid region"
            ]
        },
        {
            "condition": "Check if region is allowed",
            "attribute_path": ["region"],
            "values": vars.variables.allowed_regions,
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Subscription must use allowed refresh policies",
            "remedies": [
                "Restrict refresh_policy to one of the allowed values",
                "Update Terraform config to enforce valid refresh_policy"
            ]
        },
        {
            "condition": "Check if refresh_policy is allowed",
            "attribute_path": ["refresh_policy"],
            "values": vars.variables.allowed_refresh_policies,
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance
details := helpers.get_multi_summary(conditions, vars.variables).details
