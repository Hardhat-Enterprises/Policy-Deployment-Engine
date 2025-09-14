package terraform.gcp.security.app_engine.google_app_engine_service_network_settings.network_settings

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_network_settings.vars

conditions := [
    [
        {
            "situation_description": "App Engine service must restrict ingress traffic to internal only",
            "remedies": [
                "Set ingress_traffic_allowed to INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY",
                "Do not leave ingress_traffic_allowed unset",
                "Review network requirements for this service"
            ]
        },
        {
            "condition": "Check if ingress_traffic_allowed is set and compliant",
            "attribute_path": ["network_settings","ingress_traffic_allowed"],
            "values": ["INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
