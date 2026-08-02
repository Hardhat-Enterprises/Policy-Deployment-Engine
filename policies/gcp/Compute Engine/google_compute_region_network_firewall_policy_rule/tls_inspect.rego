package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.tls_inspect

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "TLS inspection is disabled for a security-profile-group firewall rule, so encrypted traffic may bypass inspection.",
            "remedies": [
                "Set tls_inspect to true when action is apply_security_profile_group."
            ]
        },
        {
            "condition": "Check if tls_inspect is enabled",
            "attribute_path": ["tls_inspect"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
