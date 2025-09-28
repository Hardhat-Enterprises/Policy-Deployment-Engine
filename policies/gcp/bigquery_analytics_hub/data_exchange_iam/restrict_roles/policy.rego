package terraform.gcp.security.analytics_hub.data_exchange_iam.restrict_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_iam.vars

conditions := [
    [
        {
            "situation_description": "c1: IAM role must not be overly permissive (e.g., roles/owner, roles/editor, roles/admin)",
            "remedies": [
                "Use least-privilege roles such as roles/viewer",
                "If additional permissions are required, create a custom role with only the needed permissions"
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
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
