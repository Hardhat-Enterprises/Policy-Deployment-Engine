package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_common_name_value

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The configured TLS common name does not match an approved identity for the backend target server.",
            "remedies": [
                "Set s_sl_info.common_name.value to the expected backend certificate common name.",
                "Ensure that the configured value matches the identity in the backend TLS certificate.",
                "Update the policy when the approved backend hostname or certificate identity changes."
            ]
        },
        {
            "condition": "Check whether the configured TLS common name is approved for the backend target server.",
            "attribute_path": [
                "s_sl_info",
                0,
                "common_name",
                0,
                "value"
            ],
            "values": [
                "backend.example.com"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
