package terraform.gcp.security.analytics_hub.listing_iam.restrict_overly_permissive_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

conditions := [
    [
        {
            "situation_description": "c1: IAM role must not be overly permissive (e.g., roles/owner, roles/editor, roles/admin)",
            "remedies": [
                "Use least-privilege roles such as roles/viewer",
                "If broader access is required, create a custom role with only the necessary permissions"
            ]
        },
        {
            "condition": "Check for overly permissive IAM roles",
            "attribute_path": ["role"],
            "values": ["roles/owner", "roles/editor", "roles/admin"],
            "policy_type": "blacklist"
        }
    ]
]

# Compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance report
details := helpers.get_multi_summary(conditions, vars.variables).details
