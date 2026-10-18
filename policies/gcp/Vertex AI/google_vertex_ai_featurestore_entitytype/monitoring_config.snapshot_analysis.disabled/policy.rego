package terraform.gcp.security.vertex_ai.google_vertex_ai_featurestore_entitytype.monitoring_config_snapshot_analysis_disabled

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_featurestore_entitytype.vars

conditions := [
    [
        {
            "situation_description": "Ensure Snapshot Analysis monitoring is enabled for Vertex AI Featurestore EntityType.",
            "remedies": ["Set `monitoring_config.snapshot_analysis.disabled` to `false`."]
        },
        {
            "condition": "snapshot_analysis is disabled or missing",
            "attribute_path": ["monitoring_config", 0, "snapshot_analysis", 0, "disabled"],
            "values": [false, "false"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details