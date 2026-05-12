package terraform.gcp.security.apigee.google_apigee_environment_iam.apigee_environment_iam_member_public_access

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_iam.vars

conditions := [
    [
        {
            "situation_description": "Apigee Environment IAM member grants access to allUsers or allAuthenticatedUsers which allows public access to the environment",
            "remedies": [
                "Remove allUsers and allAuthenticatedUsers from IAM members",
                "Grant access only to specific users, service accounts or groups",
                "Example: user:jane@example.com or serviceAccount:my-app@appspot.gserviceaccount.com"
            ]
        },
        {
            "condition": "Check if member is not allUsers or allAuthenticatedUsers",
            "attribute_path": ["member"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
