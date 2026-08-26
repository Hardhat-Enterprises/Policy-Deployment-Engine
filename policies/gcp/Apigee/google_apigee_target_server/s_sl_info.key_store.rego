package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_key_store

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server does not use an approved keystore for mutual TLS client authentication.",
            "remedies": [
                "Set s_sl_info.key_store to an approved keystore reference.",
                "Ensure that the keystore contains a valid client certificate and private key.",
                "Use a managed keystore reference to simplify certificate rotation."
            ]
        },
        {
            "condition": "Check whether the configured keystore is approved for mutual TLS authentication.",
            "attribute_path": [
                "s_sl_info",
                0,
                "key_store"
            ],
            "values": [
                "ref://approved-keystore-reference"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
