package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.disabled

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "Firewall policy rule is disabled, so matching traffic is not enforced.",
            "remedies": [
                "Set disabled to false so the firewall rule remains enforced."
            ]
        },
        {
            "condition": "Check if disabled is false",
            "attribute_path": ["disabled"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
