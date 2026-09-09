package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.rule_tls_inspect

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "TLS inspection must be enabled when security profile inspection is applied.",
            "remedies": [
                "Set rule.tls_inspect to true."
            ]
        },
        {
            "condition": "TLS inspection is disabled.",
            "attribute_path": ["rule", 0, "tls_inspect"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details