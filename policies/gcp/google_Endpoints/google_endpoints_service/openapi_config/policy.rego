package terraform.gcp.security.google_Endpoints.google_endpoints_service.openapi_config

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config does not enforce HTTPS.",
            "remedies": [
                "Set openapi_config to use https."
            ]
        },
        {
            "condition": "Check that openapi_config uses https.",
            "attribute_path": ["openapi_config"],
            "values": ["https"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details