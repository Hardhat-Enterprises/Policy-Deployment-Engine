package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.deployed_index_auth_config_auth_provider_allowed_issuers

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "The deployed index does not set a list of allowed JWT issuers. Authentication is then not limited to trusted issuers.",
            "remedies": [
                "Set 'deployed_index_auth_config.auth_provider.allowed_issuers' to a list of trusted service accounts."
            ]
        },
        {
            "condition": "Check that allowed JWT issuers are set",
            "attribute_path": ["deployed_index_auth_config", 0, "auth_provider", 0, "allowed_issuers"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details