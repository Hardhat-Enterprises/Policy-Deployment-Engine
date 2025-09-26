package terraform.gcp.security.analytics_hub.data_exchange_subscription.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_subscription.vars

conditions := [
    [
        {
            "situation_description": "c1: Destination dataset must include at least one label for ownership and one for environment",
            "remedies": [
                "Add dataset labels like environment=production or owner=team-x",
                "Ensure both 'environment' and 'owner' labels are present"
            ]
        },
        {
            "condition": "Check if destination_dataset.labels contains required keys",
            "attribute_path": ["destination_dataset", "labels"],
            "values": ["environment", "owner"],
            "policy_type": "key whitelist"
        }
    ],
    [
        {
            "situation_description": "c2: Subscription must not allow public access via allUsers or allAuthenticatedUsers",
            "remedies": [
                "Remove allUsers/allAuthenticatedUsers from IAM bindings",
                "Restrict subscription access to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check subscription IAM bindings for risky members",
            "attribute_path": ["iam_policy", "members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation output
details := helpers.get_multi_summary(conditions, vars.variables).details
