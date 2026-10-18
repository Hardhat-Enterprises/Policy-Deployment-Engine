package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store_featureview.region

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store_featureview.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Feature Online Store FeatureView is created in approved regions.",
            "remedies": ["Set the `region` attribute to an approved region (e.g., `us-central1`, `australia-southeast1`)."]
        },
        {
            "condition": "region is not in the approved list",
            "attribute_path": ["region"],
            "values": ["us-central1", "australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
