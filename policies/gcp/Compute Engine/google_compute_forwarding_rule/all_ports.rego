package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.all_ports

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule must not forward traffic on all ports.",
            "remedies": [
                "Set all_ports to false.",
                "Use 'ports' or 'port_range' to forward only the specific ports the workload needs."
            ]
        },
        {
            "condition": "all_ports must not be true",
            "attribute_path": ["all_ports"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
