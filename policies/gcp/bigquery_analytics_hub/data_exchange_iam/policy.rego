package terraform.gcp.security.analytics_hub.data_exchange_iam.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_iam.vars

# STEP 1: STUDY RESOURCE ATTRIBUTES (role, members)
# STEP 2: CREATE SCENARIOS

conditions := [
    [
        {
            "situation_description" : "IAM role must not be overly permissive (e.g., roles/owner).",
            "remedies":[ 
                "Use least-privilege roles such as roles/viewer or roles/editor",
                "Avoid granting roles/owner to data exchange bindings"
            ]
        },
        {
            "condition": "Check that role is not roles/owner",
            "attribute_path" : ["role"], 
            "values" : ["roles/owner"], 
            "policy_type" : "blacklist"
        }
    ],
    [
        {
            "situation_description" : "IAM members must not include allUsers or allAuthenticatedUsers.",
            "remedies":[ 
                "Remove allUsers/allAuthenticatedUsers from members",
                "Grant access only to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check for risky IAM members",
            "attribute_path" : ["members"], 
            "values" : ["allUsers","allAuthenticatedUsers"], 
            "policy_type" : "blacklist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary
details := helpers.get_multi_summary(conditions, vars.variables).details
