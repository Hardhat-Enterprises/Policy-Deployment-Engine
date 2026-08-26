package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.location

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints are deployed in approved locations.",
            "remedies": ["Set `location` to an approved region (e.g., us-central1)."]
        },
        {
            "condition": "location is not in the approved list",
            "attribute_path": ["location"],
            "values": ["us-central1", "australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details