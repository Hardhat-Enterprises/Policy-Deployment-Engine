package terraform.gcp.security.identity_platform.google_identity_platform_config.blocking_functions_forward_inbound_credentials_id_token

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "OIDC ID tokens are forwarded to blocking functions.",
            "remedies": [
                "Set id_token to false to avoid exposing identity tokens to blocking functions."
            ]
        },
        {
            "condition": "OIDC ID-token forwarding must be disabled",
            "attribute_path": ["blocking_functions",0,"forward_inbound_credentials",0,"id_token"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
