package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_trust_store

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server does not use an approved truststore for backend TLS certificate validation.",
            "remedies": [
                "Set s_sl_info.trust_store to an approved truststore reference.",
                "Ensure that the truststore contains the complete trusted certificate chain for the backend service.",
                "Use a managed truststore reference to simplify certificate rotation."
            ]
        },
        {
            "condition": "Check whether the configured truststore is approved for backend certificate validation.",
            "attribute_path": [
                "s_sl_info",
                0,
                "trust_store"
            ],
            "values": [
                "ref://approved-truststore-reference"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
