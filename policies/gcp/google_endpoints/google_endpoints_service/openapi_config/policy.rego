package terraform.gcp.security.google_endpoints.google_endpoints_service.openapi_config

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config allows HTTP.",
            "remedies": [
                "Remove http from the OpenAPI schemes section.",
                "Allow only https in openapi_config."
            ]
        },
        {
            "condition": "Google Cloud Endpoints service openapi_config must not allow HTTP.",
            "attribute_path": ["openapi_config"],
            "values": ["http"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details