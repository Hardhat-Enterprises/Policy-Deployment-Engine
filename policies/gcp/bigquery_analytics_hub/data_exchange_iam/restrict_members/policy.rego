package terraform.gcp.security.analytics_hub.data_exchange_iam.restrict_members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_iam.vars

conditions := [
    [
        {
            "situation_description": "c2: IAM members must not include public identities (allUsers or allAuthenticatedUsers)",
            "remedies": [
                "Remove allUsers or allAuthenticatedUsers from IAM bindings",
                "Grant access only to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check for risky IAM members",
            "attribute_path": ["members"],
            "values": [
                "allUsers",
                "allAuthenticatedUsers"
            ],
            "policy_type": "blacklist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
