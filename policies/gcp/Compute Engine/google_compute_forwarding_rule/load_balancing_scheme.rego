package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.load_balancing_scheme

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule must not use an externally reachable load balancing scheme unless internet exposure is explicitly required.",
            "remedies": [
                "Set load_balancing_scheme to 'INTERNAL' or 'INTERNAL_MANAGED' unless the rule must be reachable from the public internet.",
                "If external exposure is required, document the approval and pair it with a restrictive source_ip_ranges list."
            ]
        },
        {
            "condition": "load_balancing_scheme must not be EXTERNAL or EXTERNAL_MANAGED",
            "attribute_path": ["load_balancing_scheme"],
            "values": ["EXTERNAL", "EXTERNAL_MANAGED"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
