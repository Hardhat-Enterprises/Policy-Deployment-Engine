package terraform.gcp.security.analytics_hub.data_exchange_listing.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_listing.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (simple: listing display_name must start with prefix)
conditions := [
    [
        {
            "situation_description": "Analytics Hub Listing display_name must start with the required prefix",
            "remedies": [
                "Rename the Listing so that its display_name begins with the configured prefix",
                "Update the Terraform resource to include the prefix defined in vars"
            ]
        },
        {
            "condition": "Check if display_name starts with the allowed prefix",
            "attribute_path": ["display_name"],
            "values": [vars.variables.prefix],
            "policy_type": "pattern whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance
details := helpers.get_multi_summary(conditions, vars.variables).details
