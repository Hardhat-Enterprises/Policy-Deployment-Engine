package terraform.gcp.security.identity_platform.google_identity_platform_config.blocking_functions_forward_inbound_credentials_refresh_token

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "OAuth refresh tokens are forwarded to blocking functions.",
            "remedies": [
                "Set refresh_token to false to prevent long-lived credentials from reaching blocking functions."
            ]
        },
        {
            "condition": "OAuth refresh-token forwarding must be disabled",
            "attribute_path": ["blocking_functions",0,"forward_inbound_credentials",0,"refresh_token"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
