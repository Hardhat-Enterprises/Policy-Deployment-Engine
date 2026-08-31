package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.network_match_user_defined_fields_values

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule contains user-defined packet matching values that conflict with the organisation's restricted traffic-matching baseline.",
            "remedies": [
                "Remove prohibited values or ranges from the user-defined field match configuration.",
                "Define only the minimum packet-field values or ranges required for the intended security rule.",
                "Review broad custom match ranges through the organisation's network security change-control process before deployment."
            ]
        },
        {
            "condition": "Prevent prohibited user-defined packet matching values from being used in the regional security policy rule.",
            "attribute_path": ["network_match", 0, "user_defined_fields", 0, "values"],
            "values": [
                "0-4294967295",
                "0x0-0xffffffff"
            ],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
