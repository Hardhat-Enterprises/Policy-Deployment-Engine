package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.deployed_index_auth_config_auth_provider_allowed_issuers

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "The deployed index does not set a list of allowed JWT issuers, so authentication is not restricted to trusted issuers.",
            "remedies": [
                "Set 'allowed_issuers' to a list of trusted service accounts."
            ]
        },
        {
            "condition": "allowed_issuers must be set",
            "attribute_path": ["deployed_index_auth_config", 0, "auth_provider", 0, "allowed_issuers"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "An allowed JWT issuer is not a Google service account. Only service-account issuers should be trusted.",
            "remedies": [
                "Set each entry in 'allowed_issuers' to a service account of the form name@project.iam.gserviceaccount.com."
            ]
        },
        {
            "condition": "allowed_issuers must not contain untrusted issuers",
            "attribute_path": ["deployed_index_auth_config", 0, "auth_provider", 0, "allowed_issuers"],
            "values": ["allUsers", "allAuthenticatedUsers", "@gmail.com", "@googlegroups.com"],
            "policy_type": "element blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
