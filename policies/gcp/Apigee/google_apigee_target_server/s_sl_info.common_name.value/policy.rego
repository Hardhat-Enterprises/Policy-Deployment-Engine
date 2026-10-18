package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_common_name_value

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The TLS common name for the backend target server is missing or empty.",
            "remedies": [
                "Set s_sl_info.common_name.value to the backend certificate common name.",
                "Ensure the configured value matches the identity in the backend TLS certificate.",
                "Verify that the TLS common name is not null or empty."
            ]
        },
        {
            "condition": "Check whether the configured TLS common name is present and non-empty.",
            "attribute_path": [
                "s_sl_info",
                0,
                "common_name",
                0,
                "value"
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
