package terraform.gcp.security.analytics_hub.listing

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing.vars

# Define conditions for compliance
conditions := [
    [
        {
            "situation_description" : "Listing display_name must start with the prefix 'de-'.",
            "remedies":[ 
                "Rename the Listing so that its display_name starts with 'de-'",
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
            "situation_description" : "Listing ID must only contain lowercase letters, numbers, and underscores.",
            "remedies":[ 
                "Update the listing_id to only use lowercase letters, numbers, or underscores",
                "Avoid uppercase letters, spaces, or special characters"
            ]
        },
        {
            "condition": "Check if listing_id follows allowed character pattern",
            "attribute_path" : ["listing_id"], 
            "values" : ["^[a-z0-9_]+$"], 
            "policy_type" : "pattern whitelist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
