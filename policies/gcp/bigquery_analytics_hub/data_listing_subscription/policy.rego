package terraform.gcp.security.analytics_hub.listing_subscription.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_subscription.vars

# Conditions to enforce
conditions := [
    [
        {
            "situation_description" : "Listing Subscription ID must only contain lowercase letters, numbers, and underscores, with length 3–50.",
            "remedies":[ 
                "Update subscription_id to use only lowercase letters, numbers, or underscores",
                "Ensure the ID length is between 3 and 50 characters"
            ]
        },
        {
            "condition": "Check subscription_id follows allowed naming convention",
            "attribute_path" : ["subscription_id"], 
            "values" : ["^[a-z0-9_]{3,50}$"], 
            "policy_type" : "regex whitelist"
        }
    ],
    [
        {
            "situation_description" : "Destination dataset_id must comply with BigQuery standards (lowercase letters, numbers, underscores, 3–50 chars).",
            "remedies":[ 
                "Rename dataset_id using only lowercase letters, numbers, or underscores",
                "Ensure dataset_id length is between 3 and 50 characters"
            ]
        },
        {
            "condition": "Check dataset_id format",
            "attribute_path" : ["destination_dataset", "dataset_reference", "dataset_id"], 
            "values" : ["^[a-z0-9_]{3,50}$"], 
            "policy_type" : "regex whitelist"
        }
    ],
    [
        {
            "situation_description" : "Friendly name must only use letters, numbers, spaces, hyphens, or underscores (no emojis), with length 1–100.",
            "remedies":[ 
                "Update friendly_name to plain text only",
                "Avoid emojis, special Unicode characters, or excessive length"
            ]
        },
        {
            "condition": "Check friendly_name format",
            "attribute_path" : ["destination_dataset", "friendly_name"], 
            "values" : ["^[a-zA-Z0-9_\\- ]{1,100}$"], 
            "policy_type" : "regex whitelist"
        }
    ]
]

# General message (summary)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
