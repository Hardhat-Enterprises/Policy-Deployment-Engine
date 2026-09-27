package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.dedicated_serving_endpoint_private_service_connect_config_project_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The project allowlist contains an overly broad entry. A wildcard entry lets untrusted projects reach the private serving endpoint.",
            "remedies": [
                "Remove wildcard entries from 'project_allowlist'. List only the specific projects that need access."
            ]
        },
        {
            "condition": "Allowlist must not contain overly broad entries",
            "attribute_path": ["dedicated_serving_endpoint", 0, "private_service_connect_config", 0, "project_allowlist"],
            "values": ["*", "0.0.0.0", "all"],
            "policy_type": "element blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details