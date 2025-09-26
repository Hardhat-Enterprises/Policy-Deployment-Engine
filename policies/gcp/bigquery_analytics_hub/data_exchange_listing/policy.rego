package terraform.gcp.security.analytics_hub.listing

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing.vars

# Define conditions for compliance
conditions := [
    [
        {
            "situation_description": "Listing display_name must start with the prefix 'de-' and follow naming standards.",
            "remedies":[ 
                "Rename the Listing so that its display_name starts with 'de-'",
                "Use only lowercase letters, numbers, hyphens, or underscores after the prefix"
            ]
        },
        {
            "condition": "Check if display_name starts with 'de-' and follows naming convention",
            "attribute_path": ["display_name"], 
            "values": ["^de-[a-z0-9_-]+$"], 
            "policy_type": "regex whitelist"
        }
    ],
    [
        {
            "situation_description": "Listing ID must only contain lowercase letters, numbers, and underscores, with length 3–50.",
            "remedies":[ 
                "Update the listing_id to only use lowercase letters, numbers, or underscores",
                "Ensure the ID is at least 3 characters and no longer than 50 characters"
            ]
        },
        {
            "condition": "Check if listing_id follows allowed character pattern",
            "attribute_path": ["listing_id"], 
            "values": ["^[a-z0-9_]{3,50}$"], 
            "policy_type": "regex whitelist"
        }
    ],
    [
        {
            "situation_description": "Listing description must not be empty.",
            "remedies":[ 
                "Add a meaningful description for the listing",
                "Ensure the description provides context about the dataset usage"
            ]
        },
        {
            "condition": "Check that description is not empty",
            "attribute_path": ["description"], 
            "values": ["*"], 
            "policy_type": "pattern whitelist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
