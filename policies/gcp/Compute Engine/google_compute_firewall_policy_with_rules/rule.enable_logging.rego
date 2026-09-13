package terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.rule_enable_logging

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "Firewall policy rule logging must be enabled.",
            "remedies": [
                "Set rule.enable_logging to true."
            ]
        },
        {
            "condition": "Firewall policy rule logging is disabled.",
            "attribute_path": ["rule", 0, "enable_logging"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details