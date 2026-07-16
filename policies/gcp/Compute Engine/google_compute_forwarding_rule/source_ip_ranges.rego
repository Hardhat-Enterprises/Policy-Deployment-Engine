package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.source_ip_ranges

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule source IP range is too broad.",
            "remedies": [
                "Narrow source_ip_ranges to the specific IP addresses or CIDR ranges that should reach this rule.",
                "'0.0.0.0/0' allows traffic from any source IP."
            ]
        },
        {
            "condition": "source_ip_ranges must not allow 0.0.0.0/0",
            "attribute_path": ["source_ip_ranges", 0],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
