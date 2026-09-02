package terraform.gcp.security.vertex_ai.google_vertex_ai_index.region

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints are deployed in approved locations.",
            "remedies": ["Set `region` to an approved value."]
        },
        {
            "condition": "region is empty",
            "attribute_path": ["region"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details