package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.allow_psc_global_access

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "PSC endpoint must not be reachable from other regions unless explicitly required.",
            "remedies": [
                "Set allow_psc_global_access to false.",
                "Only enable global access for the PSC endpoint if cross-region access is an approved, documented requirement."
            ]
        },
        {
            "condition": "allow_psc_global_access must not be true",
            "attribute_path": ["allow_psc_global_access"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
