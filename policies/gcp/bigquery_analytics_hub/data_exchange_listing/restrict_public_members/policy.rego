package terraform.gcp.security.analytics_hub.listing.restrict_public_members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing.vars

conditions := [
    [
        {
            "situation_description": "c1: Listing IAM policy must not allow public identities (allUsers or allAuthenticatedUsers)",
            "remedies":[ 
                "Remove allUsers/allAuthenticatedUsers from IAM bindings",
                "Restrict access to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check for risky IAM members in listing IAM policy",
            "attribute_path": ["iam_policy", "members"], 
            "values": ["allUsers", "allAuthenticatedUsers"], 
            "policy_type": "blacklist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
