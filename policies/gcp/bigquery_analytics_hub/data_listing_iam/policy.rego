package terraform.gcp.security.analytics_hub.listing_iam.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

conditions := [
    [
        {
            "situation_description": "c1: IAM role must not be overly permissive (e.g., roles/owner, roles/editor, roles/admin)",
            "remedies": [
                "Use least-privilege roles such as roles/viewer",
                "If broader access is required, define a custom role with only the necessary permissions"
            ]
        },
        {
            "condition": "Check that IAM role is not overly permissive",
            "attribute_path": ["role"],
            "values": [
                "roles/owner",
                "roles/editor",
                "roles/admin"
            ],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "c2: IAM bindings must not contain risky principals and members list must not be empty",
            "remedies": [
                "Remove allUsers/allAuthenticatedUsers and replace with specific users, groups, or service accounts",
                "Ensure members attribute is not empty"
            ]
        },
        {
            "condition": "Check IAM members for risky or invalid principals",
            "attribute_path": ["members"],
            "values": [
                "",
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
