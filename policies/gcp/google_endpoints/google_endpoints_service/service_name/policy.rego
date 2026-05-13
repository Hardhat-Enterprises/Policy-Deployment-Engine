package terraform.gcp.security.google_endpoints.google_endpoints_service.service_name

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service service_name uses a disallowed value.",
            "remedies": [
                "Set service_name to an approved compliant value."
            ]
        },
        {
            "condition": "Google Cloud Endpoints service service_name must not use a disallowed value.",
            "attribute_path": ["service_name"],
            "values": ["nc"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details