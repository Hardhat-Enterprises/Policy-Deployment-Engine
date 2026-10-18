package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store can be deleted by Terraform. A mistake in a plan or apply can then remove the store and its data.",
            "remedies": [
                "Set 'deletion_policy' to PREVENT so Terraform cannot destroy the Feature Online Store."
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