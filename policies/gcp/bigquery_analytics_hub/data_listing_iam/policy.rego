package terraform.gcp.security.analytics_hub.listing_iam.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

conditions := [
    [
        {
            "situation_description": "Listing ID must follow standard naming convention (prefix 'de-', lowercase, 3–50 chars).",
            "remedies": [
                "Rename listing_id to start with 'de-'",
                "Use only lowercase letters, numbers, underscores, or hyphens",
                "Keep length between 3 and 50 characters"
            ]
        },
        {
            "condition": "Check listing_id naming pattern",
            "attribute_path": ["listing_id"],
            "values": ["^de-[a-z0-9_-]{3,50}$"],
            "policy_type": "regex whitelist"
        }
    ],
    [
        {
            "situation_description": "IAM role must not be overly permissive (e.g., roles/owner, roles/editor, roles/admin).",
            "remedies": [
                "Use least privilege roles such as roles/viewer",
                "If broader access is required, define a custom role with only necessary permissions"
            ]
        },
        {
            "condition": "Check that IAM role is not overly permissive",
            "attribute_path": ["role"],
            "values": ["roles/owner", "roles/editor", "roles/admin"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM bindings must include valid members and must not contain risky principals like allUsers or allAuthenticatedUsers.",
            "remedies": [
                "Ensure members array is not empty",
                "Remove allUsers/allAuthenticatedUsers and replace with specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check IAM members validity",
            "attribute_path": ["members"],
            "values": ["^$", "allUsers", "allAuthenticatedUsers"],
            "policy_type": "pattern blacklist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
