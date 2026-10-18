package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure the endpoint cannot be accidentally deleted.",
            "remedies": ["Set `deletion_policy` to PREVENT."]
        },
        {
            "condition": "deletion_policy is not set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details