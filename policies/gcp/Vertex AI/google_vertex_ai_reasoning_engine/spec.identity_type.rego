package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.spec_identity_type

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine does not use managed Agent Identity. It uses a service account instead. A service account uses a long-lived credential, so it is easier to misuse if it leaks.",
            "remedies": [
                "Set 'spec.identity_type' to 'AGENT_IDENTITY' so that Google manages the identity for the engine."
            ]
        },
        {
            "condition": "Check that the engine uses managed Agent Identity",
            "attribute_path": ["spec", 0, "identity_type"],
            "values": ["AGENT_IDENTITY"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details