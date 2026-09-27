package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.spec_deployment_spec_env_value

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine sets a plaintext secret as an environment variable value. Secrets must come from Secret Manager via secret_env, not be inlined.",
            "remedies": [
                "Move the secret to Secret Manager and reference it through spec.deployment_spec.secret_env instead of a plaintext env value."
            ]
        },
        {
            "condition": "env value must not be a known plaintext secret",
            "attribute_path": ["spec", 0, "deployment_spec", 0, "env", 0, "value"],
            "values": ["my-secret-password"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
