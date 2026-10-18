package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.spec_deployment_spec_secret_env_secret_ref_secret

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine deployment does not set a Secret Manager reference for a secret environment variable. Credentials should come from Secret Manager, not be left unset or inline.",
            "remedies": [
                "Set 'spec.deployment_spec.secret_env.secret_ref.secret' to a Secret Manager secret reference."
            ]
        },
        {
            "condition": "Secret Manager reference must be set",
            "attribute_path": ["spec", 0, "deployment_spec", 0, "secret_env", 0, "secret_ref", 0, "secret"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details