package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_common_name_wildcard_match

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "Wildcard matching is enabled for backend TLS certificate common-name validation, which allows a broader range of certificate identities to be accepted.",
            "remedies": [
                "Set s_sl_info.common_name.wildcard_match to false.",
                "Configure an exact expected common name for the backend certificate.",
                "Use wildcard matching only when explicitly required and approved."
            ]
        },
        {
            "condition": "Check whether wildcard common-name matching is disabled.",
            "attribute_path": [
                "s_sl_info",
                0,
                "common_name",
                0,
                "wildcard_match"
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
