package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_key_alias

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The client certificate key alias for mutual TLS authentication is missing or empty.",
            "remedies": [
                "Set s_sl_info.key_alias to a valid client certificate alias.",
                "Ensure that the specified alias exists in the configured keystore.",
                "Use a valid and unexpired certificate intended for backend client authentication."
            ]
        },
        {
            "condition": "Check whether the client certificate key alias is present and non-empty.",
            "attribute_path": [
                "s_sl_info",
                0,
                "key_alias"
            ],
            "values": [
                null,
                ""
            ],
            "policy_type": "blacklist"
        }
    ]
]

# Evaluates the conditions once and stores the summary
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
