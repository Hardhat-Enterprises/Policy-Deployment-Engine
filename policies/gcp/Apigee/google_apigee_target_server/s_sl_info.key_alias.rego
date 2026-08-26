package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_key_alias

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server does not use an approved client certificate alias for mutual TLS authentication.",
            "remedies": [
                "Set s_sl_info.key_alias to an approved client certificate alias.",
                "Ensure that the alias exists in the configured keystore.",
                "Use a valid and unexpired certificate issued for backend client authentication."
            ]
        },
        {
            "condition": "Check whether the configured key alias is approved for mutual TLS authentication.",
            "attribute_path": [
                "s_sl_info",
                0,
                "key_alias"
            ],
            "values": [
                "approved-client-certificate"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
