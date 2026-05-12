package terraform.gcp.security.google_Endpoints.google_endpoints_service_iam.allowed_members

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service IAM members includes a principal outside the approved members list.",
            "remedies": [
                "Use only approved members in members.",
                "Update the binding to match the allowed members list."
            ]
        },
        {
            "condition": "Check that the first member does not use a disallowed principal.",
            "attribute_path": ["members", 0],
            "values": [
                "domain:example.com",
                "allUsers",
                "allAuthenticatedUsers"
            ],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details