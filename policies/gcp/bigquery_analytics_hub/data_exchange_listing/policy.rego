package terraform.gcp.security.analytics_hub.listing.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing.vars

conditions := [
    [
        {
            "situation_description": "c1: Listing must not be shared publicly with allUsers or allAuthenticatedUsers",
            "remedies":[ 
                "Remove allUsers/allAuthenticatedUsers from the listing IAM policy",
                "Restrict access to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check for risky IAM members on listing",
            "attribute_path": ["iam_policy", "members"], 
            "values": [
                "allUsers",
                "allAuthenticatedUsers"
            ], 
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "c2: Listing must only use approved regions",
            "remedies":[ 
                "Ensure listing region is australia-southeast1 or australia-southeast2",
                "Update the Terraform configuration to an approved region"
            ]
        },
        {
            "condition": "Check if listing region is approved",
            "attribute_path": ["location"], 
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ], 
            "policy_type": "pattern whitelist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
