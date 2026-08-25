package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "The deployed index can be deleted by Terraform. A mistake in a plan or apply can then remove the deployment.",
            "remedies": [
                "Set 'deletion_policy' to PREVENT so Terraform cannot destroy the deployed index."
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