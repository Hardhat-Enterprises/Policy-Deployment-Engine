package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_key_store

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The keystore reference for mutual TLS client authentication is missing or empty.",
            "remedies": [
                "Set s_sl_info.key_store to a valid keystore reference.",
                "Ensure that the keystore contains a valid client certificate and private key.",
                "Use a managed keystore reference to support secure certificate rotation."
            ]
        },
        {
            "condition": "Check whether the keystore reference is present and non-empty.",
            "attribute_path": [
                "s_sl_info",
                0,
                "key_store"
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
