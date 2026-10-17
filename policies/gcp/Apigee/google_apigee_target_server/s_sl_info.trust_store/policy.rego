package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_trust_store

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The truststore reference for backend TLS certificate validation is missing or empty.",
            "remedies": [
                "Set s_sl_info.trust_store to a valid truststore reference.",
                "Ensure that the truststore contains the complete trusted certificate chain for the backend service.",
                "Use a managed truststore reference to support secure certificate rotation."
            ]
        },
        {
            "condition": "Check whether the truststore reference is present and non-empty.",
            "attribute_path": [
                "s_sl_info",
                0,
                "trust_store"
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
