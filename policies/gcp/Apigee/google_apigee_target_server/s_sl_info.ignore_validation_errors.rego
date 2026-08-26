package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_ignore_validation_errors

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "TLS certificate validation errors are ignored for the Apigee target server, which could allow connections to a backend presenting an invalid or untrusted certificate.",
            "remedies": [
                "Set s_sl_info.ignore_validation_errors to false.",
                "Configure an appropriate truststore for backend certificate validation.",
                "Ensure that the backend certificate is valid, trusted, unexpired, and matches the target hostname."
            ]
        },
        {
            "condition": "Check whether TLS certificate validation errors are not ignored.",
            "attribute_path": [
                "s_sl_info",
                0,
                "ignore_validation_errors"
            ],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
