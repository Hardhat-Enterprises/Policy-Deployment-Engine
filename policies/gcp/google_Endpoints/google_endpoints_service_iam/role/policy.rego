package terraform.gcp.security.google_Endpoints.google_endpoints_service_iam.role

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service IAM role uses a forbidden service agent role.",
            "remedies": [
                "Remove the service agent role from the IAM binding.",
                "Use a least-privilege non-service-agent role instead."
            ]
        },
        {
            "condition": "Check that role does not use the Cloud Endpoints service agent role.",
            "attribute_path": ["role"],
            "values": ["roles/endpoints.serviceAgent"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details