package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.private_service_connect_config_project_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints Private Service Connect project allowlist only contains approved projects.",
            "remedies": ["Configure the `project_allowlist` within `private_service_connect_config` to match the approved project pattern."]
        },
        {
            "condition": "project_allowlist is missing or contains unapproved projects",
            "attribute_path": ["private_service_connect_config", 0, "project_allowlist", 0], # 注意末尾增加了 , 0
            "values": ["^approved-project-.*$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details