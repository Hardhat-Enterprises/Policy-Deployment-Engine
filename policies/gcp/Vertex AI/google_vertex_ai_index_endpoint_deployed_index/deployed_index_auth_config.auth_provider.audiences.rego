package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.deployed_index_auth_config_auth_provider_audiences

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "An allowed JWT audience is a wildcard or overly broad value. Audiences must be specific so only intended clients are accepted.",
            "remedies": [
                "Set each entry in 'audiences' to a specific intended audience, not a wildcard or empty value."
            ]
        },
        {
            "condition": "audiences must not contain overly broad values",
            "attribute_path": ["deployed_index_auth_config", 0, "auth_provider", 0, "audiences"],
            "values": ["*", "any", "all", "public"],
            "policy_type": "element blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
