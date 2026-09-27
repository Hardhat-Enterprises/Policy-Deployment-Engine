package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.dedicated_serving_endpoint_private_service_connect_config_enable_private_service_connect

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store serving endpoint is public. Requests reach the store over the public network instead of a private connection.",
            "remedies": [
                "Set 'dedicated_serving_endpoint.private_service_connect_config.enable_private_service_connect' to true so requests use Private Service Connect."
            ]
        },
        {
            "condition": "Check that the serving endpoint uses Private Service Connect",
            "attribute_path": ["dedicated_serving_endpoint", 0, "private_service_connect_config", 0, "enable_private_service_connect"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details