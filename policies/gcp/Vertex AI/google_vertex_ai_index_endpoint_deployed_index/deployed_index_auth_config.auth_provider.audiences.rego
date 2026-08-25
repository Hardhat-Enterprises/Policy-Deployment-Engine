package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.deployed_index_auth_config_auth_provider_audiences

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "The deployed index does not set a list of allowed JWT audiences. Any audience is then accepted at the endpoint.",
            "remedies": [
                "Set 'deployed_index_auth_config.auth_provider.audiences' to the list of audiences that should be accepted."
            ]
        },
        {
            "condition": "Check that allowed JWT audiences are set",
            "attribute_path": ["deployed_index_auth_config", 0, "auth_provider", 0, "audiences"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details