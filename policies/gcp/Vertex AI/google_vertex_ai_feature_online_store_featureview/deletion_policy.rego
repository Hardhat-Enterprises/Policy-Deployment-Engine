package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store_featureview.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store_featureview.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Feature Online Store FeatureView cannot be accidentally deleted.",
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
