package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.dedicated_endpoint_enabled

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints are exposed through a dedicated DNS.",
            "remedies": ["Set `dedicated_endpoint_enabled` to true."]
        },
        {
            "condition": "dedicated_endpoint_enabled is not set to true",
            "attribute_path": ["dedicated_endpoint_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details