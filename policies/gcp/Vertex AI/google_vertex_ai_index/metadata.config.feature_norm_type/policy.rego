package terraform.gcp.security.vertex_ai.google_vertex_ai_index.metadata_config_feature_norm_type

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index.vars

conditions := [
    [
        {
            "situation_description": "Ensure feature_norm_type is explicitly configured.",
            "remedies": ["Set `feature_norm_type` to a valid normalization type."]
        },
        {
            "condition": "feature_norm_type must be explicitly defined",
            "attribute_path": ["metadata", 0, "config", 0, "feature_norm_type"],
            "values": ["UNIT_L2_NORM", "NONE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details