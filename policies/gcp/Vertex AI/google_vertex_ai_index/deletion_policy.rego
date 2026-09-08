package terraform.gcp.security.vertex_ai.google_vertex_ai_index.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index.vars

conditions := [
    [
        {
            "situation_description": "Ensure the index cannot be accidentally deleted.",
            "remedies": ["Set `deletion_policy` to PREVENT."]
        },
        {
            "condition": "deletion_policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details