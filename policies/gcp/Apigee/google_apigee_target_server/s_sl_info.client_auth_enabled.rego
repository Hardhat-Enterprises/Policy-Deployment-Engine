package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info.client_auth_enabled

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "Mutual TLS authentication is not enabled for communication between Apigee and the backend target server.",
            "remedies": [
                "Set s_sl_info.client_auth_enabled to true.",
                "Configure a keystore and key alias containing the client certificate and private key.",
                "Configure an appropriate truststore for backend certificate validation."
            ]
        },
        {
            "condition": "Check whether client authentication is enabled in the target server TLS configuration.",
            "attribute_path": [
                "s_sl_info",
                0,
                "client_auth_enabled"
            ],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
