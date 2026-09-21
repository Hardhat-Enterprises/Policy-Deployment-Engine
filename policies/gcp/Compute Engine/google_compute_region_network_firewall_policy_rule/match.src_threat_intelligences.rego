package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.match_src_threat_intelligences

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "Firewall rule does not use Google threat intelligence lists for source matching.",
            "remedies": [
                "Set match.src_threat_intelligences to include a known threat list such as iplist-known-malicious-ips."
            ]
        },
        {
            "condition": "Check if src_threat_intelligences includes a known malicious IP list",
            "attribute_path": ["match", 0, "src_threat_intelligences"],
            "values": ["iplist-known-malicious-ips"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
