package terraform.gcp.security.vertex_ai.google_vertex_ai_index.metadata_config_distance_measure_type

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index.vars

conditions := [
    [
        {
            "situation_description": "Ensure distance_measure_type is explicitly configured.",
            "remedies": ["Set `distance_measure_type` to a valid mathematical algorithm."]
        },
        {
            "condition": "distance_measure_type must be explicitly defined",
            "attribute_path": ["metadata", 0, "config", 0, "distance_measure_type"],
            "values": ["SQUARED_L2_DISTANCE", "L1_DISTANCE", "COSINE_DISTANCE", "DOT_PRODUCT_DISTANCE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details