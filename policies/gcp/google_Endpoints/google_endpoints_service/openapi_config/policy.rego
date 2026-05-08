package terraform.gcp.security.google_Endpoints.google_endpoints_service.openapi_config

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config allows insecure HTTP traffic.",
            "remedies": [
                "Remove http from the schemes section.",
                "Allow only https in openapi_config."
            ]
        },
        {
            "condition": "Check that openapi_config does not include http in the OpenAPI schemes section.",
            "attribute_path": ["openapi_config"],
            "values": ["*schemes:*http*", []],
            "policy_type": "pattern blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details