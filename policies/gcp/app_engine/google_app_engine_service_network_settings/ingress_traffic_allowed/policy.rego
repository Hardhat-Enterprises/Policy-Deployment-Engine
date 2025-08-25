package terraform.gcp.security.app_engine.google_app_engine_service_network_settings.ingress_traffic_allowed

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_network_settings.vars

conditions := [
    [
        {
            "situation_description": "App Engine service allows public internet traffic",
            "remedies": [
                "Set ingress_traffic_allowed to INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY",
                "Review network requirements for this service"
            ]
        },
        {
            "condition": "Check if ingress_traffic_allowed is set to allow ALL (public access)",
            "attribute_path": ["values", "network_settings", "ingress_traffic_allowed"],
            "values": ["INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "App Engine service has no network restrictions defined",
            "remedies": [
                "Explicitly set network_settings.ingress_traffic_allowed",
                "Default network behavior may be insecure"
            ]
        },
        {
            "condition": "Check if ingress_traffic_allowed is missing",
            "attribute_path": ["values", "network_settings", "ingress_traffic_allowed"],
            "values": ["INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
