package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.region

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "The deployed index is in a region outside Australia. Index data is then stored outside the approved location.",
            "remedies": [
                "Set 'region' to australia-southeast1 (Sydney).",
                "Set 'region' to australia-southeast2 (Melbourne)."
            ]
        },
        {
            "condition": "Check that the region is an approved Australian region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details