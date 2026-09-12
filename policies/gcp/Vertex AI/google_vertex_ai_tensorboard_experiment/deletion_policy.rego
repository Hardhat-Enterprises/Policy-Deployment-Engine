package terraform.gcp.security.vertex_ai.google_vertex_ai_tensorboard_experiment.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_tensorboard_experiment.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Tensorboard Experiment cannot be accidentally deleted.",
            "remedies": ["Set the `deletion_policy` attribute to `PREVENT` or `ABANDON`."]
        },
        {
            "condition": "deletion_policy allows deletion (defaults to DELETE)",
            "attribute_path": ["deletion_policy"],
            "values": ["DELETE", ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details