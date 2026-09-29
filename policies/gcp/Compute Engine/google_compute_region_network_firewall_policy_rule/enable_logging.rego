package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.enable_logging

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "Firewall policy rule logging is disabled, reducing auditability of matched traffic.",
            "remedies": [
                "Set enable_logging to true."
            ]
        },
        {
            "condition": "Check if enable_logging is true",
            "attribute_path": ["enable_logging"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
