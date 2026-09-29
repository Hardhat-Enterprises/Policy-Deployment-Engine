package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.force_destroy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store has force destroy turned on. Deleting the store then also deletes all FeatureViews and Features inside it.",
            "remedies": [
                "Set 'force_destroy' to false so the store cannot be deleted while it still holds FeatureViews and Features."
            ]
        },
        {
            "condition": "Check that force destroy is turned off",
            "attribute_path": ["force_destroy"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details