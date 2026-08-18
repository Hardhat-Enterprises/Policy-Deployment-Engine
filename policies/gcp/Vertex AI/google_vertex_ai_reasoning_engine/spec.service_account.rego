package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.spec_service_account

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine does not have its own service account. It runs as the default Vertex AI service agent. This account has more permissions than the engine needs.",
            "remedies": [
                "Set 'spec.service_account' to a service account made for this engine. Give it only the permissions the engine needs."
            ]
        },
        {
            "condition": "Check that a dedicated service account is set",
            "attribute_path": ["spec", 0, "service_account"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details