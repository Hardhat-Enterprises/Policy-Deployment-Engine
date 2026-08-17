package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info.protocols

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server allows outdated TLS protocols that do not provide an approved level of protection for backend communication.",
            "remedies": [
                "Configure s_sl_info.protocols to allow only TLSv1.2 and TLSv1.3.",
                "Remove TLSv1, TLSv1.1, SSLv2, and SSLv3 from the configured protocols.",
                "Confirm that the backend service supports modern TLS protocols."
            ]
        },
        {
            "condition": "Check whether the target server uses only approved TLS protocols.",
            "attribute_path": [
                "s_sl_info",
                0,
                "protocols"
            ],
            "values": [
                "TLSv1.2",
                "TLSv1.3"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
