package terraform.gcp.security.google_endpoints.google_endpoints_service.require_authentication_config

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config does not define API authentication requirements.",
            "remedies": [
                "Add securityDefinitions to the OpenAPI document.",
                "Add a top-level or method-level security section so requests require authentication or API keys."
            ]
        },
        {
            "condition": "Check that openapi_config defines securityDefinitions.",
            "attribute_path": ["openapi_config"],
            "values": ["*securityDefinitions:*", []],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "Check that openapi_config defines security requirements.",
            "attribute_path": ["openapi_config"],
            "values": ["*security:*", []],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details