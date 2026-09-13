package terraform.gcp.security.apigee.google_apigee_target_server.protocol

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server uses a protocol that is not included in the organisation's approved backend protocol list.",
            "remedies": [
                "Configure protocol using an approved backend protocol.",
                "Use HTTP2, GRPC, or GRPC_TARGET where supported.",
                "Enable TLS separately when the selected protocol requires transport encryption."
            ]
        },
        {
            "condition": "Check whether the target server uses an approved protocol.",
            "attribute_path": [
                "protocol"
            ],
            "values": [
                "HTTP2",
                "GRPC",
                "GRPC_TARGET"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Evaluates the conditions once and stores the summary
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
