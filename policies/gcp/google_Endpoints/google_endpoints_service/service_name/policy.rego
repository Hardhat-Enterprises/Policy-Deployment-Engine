package terraform.gcp.security.google_Endpoints.google_endpoints_service.service_name

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service service_name does not follow the approved value.",
            "remedies": [
                "Set service_name to the approved compliant value."
            ]
        },
        {
            "condition": "Check that service_name uses the approved value.",
            "attribute_path": ["service_name"],
            "values": ["api.endpoints.my-project-12345.cloud.goog"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details