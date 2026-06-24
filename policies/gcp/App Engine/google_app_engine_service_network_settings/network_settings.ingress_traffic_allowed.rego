package terraform.gcp.security.app_engine.google_app_engine_service_network_settings.network_settings_ingress_traffic_allowed

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_network_settings.vars

conditions := [
    [
        {
            "situation_description": "App Engine service ingress is too permissive or unspecified",
            "remedies": ["Set ingress_traffic_allowed to 'INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY'"]
        },
        {
            "condition": "Enforce internal-only ingress",
            "attribute_path": ["network_settings", 0, "ingress_traffic_allowed"],
            "values": ["INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details