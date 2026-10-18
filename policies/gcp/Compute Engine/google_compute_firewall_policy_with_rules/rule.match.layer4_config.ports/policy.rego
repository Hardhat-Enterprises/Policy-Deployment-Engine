package terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.rule_match_layer4_config_ports

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "Firewall rules must explicitly restrict the ports they match.",
            "remedies": [
                "Specify only the ports required by the workload."
            ]
        },
        {
            "condition": "Ports must not be omitted, empty, or unrestricted.",
            "attribute_path": ["rule", 0, "match", 0, "layer4_config", 0, "ports"],
            "values": [null, [], "0-65535"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details