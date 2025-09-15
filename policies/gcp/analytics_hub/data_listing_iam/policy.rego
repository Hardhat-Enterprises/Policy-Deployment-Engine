package terraform.gcp.security.analytics_hub.listing_iam.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

# Conditions to enforce
conditions := [
    [
        {
            "situation_description" : "IAM role must not be overly permissive (e.g., roles/owner).",
            "remedies":[ 
                "Use least privilege roles such as roles/viewer, roles/editor, or custom roles.",
                "Avoid granting roles/owner to members unless absolutely necessary."
            ]
        },
        {
            "condition": "Check if role avoids disallowed values",
            "attribute_path" : ["role"], 
            "values" : ["roles/owner"], 
            "policy_type" : "pattern blacklist"
        }
    ],
    [
        {
            "situation_description" : "IAM member must follow valid identity formats (user:, serviceAccount:, group:, domain:, etc.).",
            "remedies":[ 
                "Ensure IAM member uses a valid prefix such as user:alice@example.com or serviceAccount:my-sa@appspot.gserviceaccount.com.",
                "Do not use invalid strings or unsupported formats."
            ]
        },
        {
            "condition": "Check IAM member format is valid",
            "attribute_path" : ["members"], 
            "values" : ["^(user:|serviceAccount:|group:|domain:|allUsers|allAuthenticatedUsers)"], 
            "policy_type" : "pattern whitelist"
        }
    ],
    [
        {
            "situation_description" : "IAM bindings must include at least one member.",
            "remedies":[ 
                "Ensure 'members' array is not empty when defining IAM bindings.",
                "Add valid user, group, or service account identities."
            ]
        },
        {
            "condition": "Check members list is not empty",
            "attribute_path" : ["members"], 
            "values" : [], 
            "policy_type" : "not empty"
        }
    ]
]

# General message (summary)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
