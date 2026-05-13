package terraform.gcp.security.google_endpoints.google_endpoints_service.configured_paths_only

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config allows unconfigured paths through ESP.",
            "remedies": [
                "Remove x-google-allow: all from openapi_config.",
                "Use the default configured behavior so only declared API methods are served."
            ]
        },
        {
            "condition": "Check that openapi_config does not set x-google-allow to all.",
            "attribute_path": ["openapi_config"],
            "values": ["*x-google-allow:*all*", []],
            "policy_type": "pattern blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details