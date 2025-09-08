package terraform.gcp.security.analytics_hub.listing_iam

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (conditions)
conditions := [
    [
        {
            "situation_description": "IAM listing resources must be created only in allowed locations",
            "remedies": [
                "Restrict location to one of the approved regions in vars.allowed_locations",
                "Update Terraform resource to use 'us' as the location"
            ]
        },
        {
            "condition": "Check if location is allowed",
            "attribute_path": ["location"],
            "values": vars.variables.allowed_locations,
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "IAM roles must not be overly permissive (owner/editor not allowed)",
            "remedies": [
                "Use least-privilege roles such as 'roles/viewer' or other custom roles",
                "Remove 'roles/owner' and 'roles/editor' from IAM bindings"
            ]
        },
        {
            "condition": "Check if role is in disallowed_roles list",
            "attribute_path": ["role"],
            "values": vars.variables.disallowed_roles,
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM bindings must not include public or overly broad members",
            "remedies": [
                "Remove 'allUsers' and 'allAuthenticatedUsers' from IAM bindings",
                "Restrict members to specific users, groups, or service accounts"
            ]
        },
        {
            "condition": "Check if IAM members contain disallowed entries",
            "attribute_path": ["members"],
            "values": vars.variables.disallowed_members,
            "policy_type": "blacklist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance
details := helpers.get_multi_summary(conditions, vars.variables).details
