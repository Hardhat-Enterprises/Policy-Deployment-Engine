package terraform.gcp.security.vertex_ai.google_vertex_ai_index.region

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints are deployed in approved locations for data residency.",
            "remedies": ["Set `region` to an approved region whitelist (e.g., us-central1)."]
        },
        {
            "condition": "region must be in the approved-region whitelist",
            "attribute_path": ["region"],
            "values": ["us-central1", "us-east1", "europe-west4", "asia-southeast1", "australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details