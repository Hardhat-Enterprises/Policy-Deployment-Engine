package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.spec_deployment_spec_env_value

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine deployment does not set an environment variable value. Configuration should be provided explicitly rather than left unset.",
            "remedies": [
                "Set 'spec.deployment_spec.env.value' for each environment variable, using a Secret Manager reference for sensitive values."
            ]
        },
        {
            "condition": "Environment variable value must be set",
            "attribute_path": ["spec", 0, "deployment_spec", 0, "env", 0, "value"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details