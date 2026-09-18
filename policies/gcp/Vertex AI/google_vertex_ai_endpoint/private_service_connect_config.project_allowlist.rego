package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.private_service_connect_config_project_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure private service connect project allowlist does not contain unauthorized projects.",
            "remedies": ["Remove unauthorized projects from the `project_allowlist`."]
        },
        {
            "condition": "project_allowlist contains unauthorized projects",
            "attribute_path": ["private_service_connect_config", 0, "project_allowlist"],
            "values": ["unauthorized-project"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details