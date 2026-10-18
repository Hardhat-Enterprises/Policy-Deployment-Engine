package terraform.gcp.security.vertex_ai.google_vertex_ai_tensorboard_experiment.location

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_tensorboard_experiment.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Tensorboard Experiment is created in approved regions.",
            "remedies": ["Set the `location` attribute to an approved region (e.g., `us-central1`, `australia-southeast1`)."]
        },
        {
            "condition": "location is not in the approved list",
            "attribute_path": ["location"],
            "values": ["us-central1", "australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details