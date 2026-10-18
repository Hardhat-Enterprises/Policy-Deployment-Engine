package terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.rule_disabled

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "Firewall policy rules must remain enabled.",
            "remedies": [
                "Set rule.disabled to false."
            ]
        },
        {
            "condition": "Firewall policy rule is disabled.",
            "attribute_path": ["rule", 0, "disabled"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details