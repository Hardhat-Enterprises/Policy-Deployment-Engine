package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.allow_global_access

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Internal load balancer must not be reachable from all regions unless explicitly required.",
            "remedies": [
                "Set allow_global_access to false.",
                "Only enable global access if clients in other regions have an approved, documented requirement to reach this internal load balancer."
            ]
        },
        {
            "condition": "allow_global_access must not be true",
            "attribute_path": ["allow_global_access"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
