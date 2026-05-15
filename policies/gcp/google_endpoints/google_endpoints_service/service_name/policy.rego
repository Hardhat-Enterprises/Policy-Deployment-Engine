package terraform.gcp.security.google_endpoints.google_endpoints_service.service_name

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service_name does not use an approved Cloud Endpoints domain.",
            "remedies": [
                "Set service_name to the approved Cloud Endpoints domain for this API.",
                "Use a Google-managed Cloud Endpoints domain such as api.endpoints.my-project-123.cloud.goog.",
                "Do not use generic or external domains such as api.example.com for service_name."
            ]
        },
        {
            "condition": "Google Cloud Endpoints service_name must match the approved Cloud Endpoints domain.",
            "attribute_path": ["service_name"],
            "values": ["api.endpoints.my-project-123.cloud.goog"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details