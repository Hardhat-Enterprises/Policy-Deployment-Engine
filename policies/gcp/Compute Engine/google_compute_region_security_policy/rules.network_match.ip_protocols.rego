package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_network_match_ip_protocols

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The security policy allows network protocols that may not be required.",
            "remedies": [
                "Restrict the rule to only the required network protocols, such as 'tcp'."
            ]
        },
        {
            "condition": "Rule network match must use only approved network protocols",
            "attribute_path": ["rules", 0, "network_match", 0, "ip_protocols"],
            "values": ["tcp"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details