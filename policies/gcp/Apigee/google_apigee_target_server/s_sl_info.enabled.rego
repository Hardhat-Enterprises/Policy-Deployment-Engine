package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_enabled

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "TLS is not enabled for communication between Apigee and the backend target server, which could expose API traffic during transmission.",
            "remedies": [
                "Set s_sl_info.enabled to true.",
                "Configure the target server to use TLS for backend communication.",
                "Use port 443 or another TLS-enabled backend port."
            ]
        },
        {
            "condition": "Check whether TLS is enabled in the target server SSL configuration.",
            "attribute_path": [
                "s_sl_info",
                0,
                "enabled"
            ],
            "values": [true],
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
