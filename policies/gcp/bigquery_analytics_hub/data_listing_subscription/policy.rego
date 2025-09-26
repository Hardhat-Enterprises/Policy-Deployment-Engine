package terraform.gcp.security.analytics_hub.listing_subscription.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_subscription.vars

conditions := [
    [
        {
            "situation_description": "c1: Destination dataset must include required governance labels for ownership and environment",
            "remedies": [
                "Add labels such as environment=production or owner=team-x",
                "Ensure both 'environment' and 'owner' labels are present"
            ]
        },
        {
            "condition": "Check that destination_dataset.labels contain required keys",
            "attribute_path": ["destination_dataset", "labels"],
            "values": ["environment", "owner"],
            "policy_type": "key whitelist"
        }
    ],
    [
        {
            "situation_description": "c2: Listing subscription must not allow public access via allUsers or allAuthenticatedUsers",
            "remedies": [
                "Remove allUsers/allAuthenticatedUsers from IAM bindings",
                "Restrict subscription access to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check IAM policy for risky members",
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
