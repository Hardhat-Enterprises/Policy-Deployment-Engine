package terraform.gcp.security.analytics_hub.listing_iam.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

conditions := [
    [
        {
            "situation_description": "listing_id must be 'c' for compliant configurations.",
            "remedies": [
                "Rename listing_id to 'c' for compliant resources."
            ]
        },
        {
            "condition": "Check if listing_id is equal to 'c'",
            "attribute_path": ["listing_id"],
            "values": ["c"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "listing_id must not start with 'nc' (non-compliant marker).",
            "remedies": [
                "Avoid using 'nc' as the prefix in listing_id.",
                "Rename to 'c' once the resource passes compliance checks."
            ]
        },
        {
            "condition": "Check if listing_id does not start with 'nc'",
            "attribute_path": ["listing_id"],
            "values": ["^nc.*$"],
            "policy_type": "pattern blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM role must not be overly permissive (e.g., roles/owner).",
            "remedies": [
                "Use least privilege roles such as roles/viewer, roles/editor, or custom roles.",
                "Avoid granting roles/owner unless absolutely necessary."
            ]
        },
        {
            "condition": "Check if role avoids disallowed values",
            "attribute_path": ["role"],
            "values": ["roles/owner"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM bindings must include at least one member.",
            "remedies": [
                "Ensure 'members' array is not empty when defining IAM bindings.",
                "Add valid user, group, or service account identities."
            ]
        },
        {
            "condition": "Check if members is not empty",
            "attribute_path": ["members"],
            "values": ["^$"],
            "policy_type": "pattern blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
