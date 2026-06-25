package terraform.gcp.security.google_endpoints.google_endpoints_service.openapi_config

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config does not enforce HTTPS.",
            "remedies": [
                "Set openapi_config to use https.",
                "Do not allow http in openapi_config."
            ]
        },
        {
            "condition": "Google Cloud Endpoints service openapi_config must use HTTPS.",
            "attribute_path": ["openapi_config"],
            "values": ["https"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details