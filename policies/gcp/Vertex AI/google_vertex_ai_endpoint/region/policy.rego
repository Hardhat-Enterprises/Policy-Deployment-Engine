package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.region

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints region configuration is within approved boundaries.",
            "remedies": ["Set `region` to an approved value."]
        },
        {
            "condition": "region is not in the approved list",
            "attribute_path": ["region"],
            "values": ["us-central1", "australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details