package terraform.gcp.security.vertex_ai.google_vertex_ai_featurestore_entitytype.monitoring_config_import_features_analysis_state

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_featurestore_entitytype.vars

conditions := [
    [
        {
            "situation_description": "Ensure Import Features Analysis is explicitly enabled for Vertex AI Featurestore EntityType.",
            "remedies": ["Set `monitoring_config.import_features_analysis.state` to `ENABLED`."]
        },
        {
            "condition": "import_features_analysis.state is not explicitly enabled",
            "attribute_path": ["monitoring_config", 0, "import_features_analysis", 0, "state"],
            "values": ["ENABLED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details