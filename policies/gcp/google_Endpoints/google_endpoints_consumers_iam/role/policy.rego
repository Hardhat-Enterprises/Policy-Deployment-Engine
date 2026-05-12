package terraform.gcp.security.google_Endpoints.google_endpoints_consumers_iam.role

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_consumers_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints consumers IAM role is not set to the approved service consumer role.",
            "remedies": [
                "Set role to roles/servicemanagement.serviceConsumer."
            ]
        },
        {
            "condition": "Check that role is set to the approved service consumer role.",
            "attribute_path": ["role"],
            "values": ["roles/servicemanagement.serviceConsumer"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details 
