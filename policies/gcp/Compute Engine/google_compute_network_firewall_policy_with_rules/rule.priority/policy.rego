package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.rule_priority

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "Firewall rule priority is outside the approved priority range.",
            "remedies": [
                "Set rule.priority to a value between 1000 and 65534."
            ]
        },
        {
            "condition": "Firewall rule priority must be within the approved range.",
            "attribute_path": ["rule", 0, "priority"],
            "values": [1000, 65534],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details