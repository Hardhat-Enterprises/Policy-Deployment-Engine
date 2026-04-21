package terraform.gcp.security.google_Endpoints.google_endpoints_consumers_iam.members

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_consumers_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints consumers IAM members includes allUsers.",
            "remedies": [
                "Remove allUsers from members.",
                "Grant access only to specific users, groups, or service accounts."
            ]
        },
        {
            "condition": "Check that members does not include allUsers.",
            "attribute_path": ["members"],
            "values": ["allUsers"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Google Cloud Endpoints consumers IAM members includes allAuthenticatedUsers.",
            "remedies": [
                "Remove allAuthenticatedUsers from members.",
                "Grant access only to specific users, groups, or service accounts."
            ]
        },
        {
            "condition": "Check that members does not include allAuthenticatedUsers.",
            "attribute_path": ["members"],
            "values": ["allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details