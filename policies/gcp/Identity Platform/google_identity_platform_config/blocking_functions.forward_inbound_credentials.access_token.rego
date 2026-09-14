package terraform.gcp.security.identity_platform.google_identity_platform_config.blocking_functions_forward_inbound_credentials_access_token

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "OAuth access tokens are forwarded to blocking functions.",
            "remedies": [
                "Set access_token to false to avoid forwarding OAuth bearer credentials to blocking functions."
            ]
        },
        {
            "condition": "OAuth access-token forwarding must be disabled",
            "attribute_path": ["blocking_functions",0,"forward_inbound_credentials",0,"access_token"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
