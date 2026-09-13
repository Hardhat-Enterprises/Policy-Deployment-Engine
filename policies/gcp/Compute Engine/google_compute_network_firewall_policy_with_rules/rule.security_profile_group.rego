package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.rule_security_profile_group

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "A security profile group must be configured when firewall inspection is required.",
            "remedies": [
                "Set rule.security_profile_group to a valid SecurityProfileGroup resource."
            ]
        },
        {
            "condition": "Security profile group is not configured.",
            "attribute_path": ["rule", 0, "security_profile_group"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details