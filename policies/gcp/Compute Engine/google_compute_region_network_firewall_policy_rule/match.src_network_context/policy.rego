package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.match_src_network_context

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "Firewall rule matches source traffic from the public INTERNET network context, widening exposure.",
            "remedies": [
                "Set match.src_network_context to a non-internet context such as INTRA_VPC, NON_INTERNET, or VPC_NETWORKS."
            ]
        },
        {
            "condition": "Check if src_network_context is not INTERNET",
            "attribute_path": ["match", 0, "src_network_context"],
            "values": ["INTERNET"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
