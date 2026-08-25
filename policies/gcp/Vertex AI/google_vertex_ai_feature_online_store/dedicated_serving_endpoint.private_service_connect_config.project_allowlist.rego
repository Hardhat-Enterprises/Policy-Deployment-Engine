package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.dedicated_serving_endpoint_private_service_connect_config_project_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store does not set a project allowlist for the private serving endpoint. The projects that may reach the endpoint are then not limited.",
            "remedies": [
                "Set 'dedicated_serving_endpoint.private_service_connect_config.project_allowlist' to the list of projects that need access."
            ]
        },
        {
            "condition": "Check that a project allowlist is set",
            "attribute_path": ["dedicated_serving_endpoint", 0, "private_service_connect_config", 0, "project_allowlist"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details