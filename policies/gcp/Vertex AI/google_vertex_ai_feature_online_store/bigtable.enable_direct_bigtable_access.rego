package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.bigtable_enable_direct_bigtable_access

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store allows direct access to the backing Bigtable instance. Clients can then reach the data without going through the controlled serving path.",
            "remedies": [
                "Set 'bigtable.enable_direct_bigtable_access' to false so all requests use the Feature Online Store serving path."
            ]
        },
        {
            "condition": "Check that direct Bigtable access is turned off",
            "attribute_path": ["bigtable", 0, "enable_direct_bigtable_access"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details