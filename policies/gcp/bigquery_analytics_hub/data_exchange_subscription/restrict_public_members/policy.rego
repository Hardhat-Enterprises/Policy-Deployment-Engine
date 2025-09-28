package terraform.gcp.security.analytics_hub.data_exchange_subscription.restrict_public_members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_subscription.vars

conditions := [
    [
        {
            "situation_description": "c2: Subscription IAM policy must not allow public identities (allUsers or allAuthenticatedUsers)",
            "remedies": [
                "Remove allUsers or allAuthenticatedUsers from IAM bindings",
                "Restrict subscription access to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check subscription IAM members for risky identities",
            "attribute_path": ["iam_policy", "members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
