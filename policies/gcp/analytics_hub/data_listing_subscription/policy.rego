package terraform.gcp.security.analytics_hub.listing_subscription.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_subscription.vars

# Conditions to enforce
conditions := [
    [
        {
            "situation_description" : "Listing Subscription ID must only contain lowercase letters, numbers, and underscores.",
            "remedies":[ 
                "Update the subscription_id to only use lowercase letters, numbers, or underscores",
                "Avoid uppercase letters, spaces, or special characters"
            ]
        },
        {
            "condition": "Check if subscription_id follows allowed character pattern",
            "attribute_path" : ["subscription_id"], 
            "values" : ["^[a-z0-9_]+$"], 
            "policy_type" : "pattern whitelist"
        }
    ],
    [
        {
            "situation_description" : "Destination dataset ID must only contain letters, numbers, or underscores.",
            "remedies":[ 
                "Ensure destination dataset_id complies with BigQuery naming standards",
                "Avoid using special characters or spaces"
            ]
        },
        {
            "condition": "Check if dataset_id follows allowed character pattern",
            "attribute_path" : ["destination_dataset", "dataset_reference", "dataset_id"], 
            "values" : ["^[a-zA-Z0-9_]+$"], 
            "policy_type" : "pattern whitelist"
        }
    ],
    [
        {
            "situation_description" : "Friendly name should not contain emojis or unsupported characters.",
            "remedies":[ 
                "Update friendly_name to plain text (letters, numbers, spaces, underscores)",
                "Avoid emojis or special characters"
            ]
        },
        {
            "condition": "Check friendly_name format",
            "attribute_path" : ["destination_dataset", "friendly_name"], 
            "values" : ["^[a-zA-Z0-9_\\- ]+$"], 
            "policy_type" : "pattern whitelist"
        }
    ]
]

# General message (summary)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
