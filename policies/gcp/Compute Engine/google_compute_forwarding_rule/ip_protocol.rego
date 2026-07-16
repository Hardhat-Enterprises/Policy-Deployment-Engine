package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.ip_protocol

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule must be restricted to protocols that support port-level filtering.",
            "remedies": [
                "Set ip_protocol to 'TCP' or 'UDP'.",
                "Avoid 'L3_DEFAULT', 'ESP', 'AH', 'SCTP' and 'ICMP' unless the workload has a documented need for raw protocol forwarding — these bypass port-level filtering."
            ]
        },
        {
            "condition": "ip_protocol is in approved whitelist",
            "attribute_path": ["ip_protocol"],
            "values": ["TCP", "UDP"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
