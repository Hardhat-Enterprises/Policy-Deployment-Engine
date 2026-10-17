package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine can be deleted by Terraform. A mistake in a plan or apply can then remove the engine.",
            "remedies": [
                "Set 'deletion_policy' to PREVENT so Terraform cannot destroy the Reasoning Engine."
            ]
        },
        {
            "condition": "Check that deletion is prevented",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details