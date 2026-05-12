package terraform.gcp.security.google_Endpoints.google_endpoints_service.service_name

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service service_name does not follow the expected Cloud Endpoints domain format.",
            "remedies": [
                "Set service_name to use the Cloud Endpoints domain format.",
                "Ensure service_name follows the pattern <api>.endpoints.<project>.cloud.goog."
            ]
        },
        {
            "condition": "Check that service_name uses the Cloud Endpoints domain format.",
            "attribute_path": ["service_name"],
            "values": ["*.endpoints.*.cloud.goog", []],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details