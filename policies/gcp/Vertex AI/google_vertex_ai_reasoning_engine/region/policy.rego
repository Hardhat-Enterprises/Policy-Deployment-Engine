package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.region

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "Reasoning Engine region is outside approved Australian regions",
            "remedies": [
                "Set region to australia-southeast1 (Sydney)",
                "Set region to australia-southeast2 (Melbourne)"
            ]
        },
        {
            "condition": "region must be an approved Australian region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details