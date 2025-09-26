package terraform.gcp.security.analytics_hub.data_exchange_iam.policy

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
            "condition": "Check that role is not overly permissive",
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
            "situation_description": "c2: IAM members must not include allUsers or allAuthenticatedUsers",
            "remedies": [ 
                "Remove allUsers/allAuthenticatedUsers from members",
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
    ],
    [
        {
            "situation_description": "c3: IAM binding must not have an empty members list",
            "remedies": [ 
                "Ensure members attribute contains valid principals (users, groups, or service accounts)"
            ]
        },
        {
            "condition": "Check for empty members list",
            "attribute_path": ["members"], 
            "values": [""], 
            "policy_type": "blacklist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance
details := helpers.get_multi_summary(conditions, vars.variables).details
