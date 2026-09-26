package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_network_match_user_defined_fields_values

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The network security rule permits an overly broad IPv4 fragment offset range.",
            "remedies": [
                "Restrict rules.network_match.user_defined_fields.values to an approved IPv4 fragment offset range."
            ]
        },
        {
            "condition": "IPv4 fragment offset values must be restricted to the approved range",
            "attribute_path": ["rules", 0, "network_match", 0, "user_defined_fields", 0, "values"],
            "values": ["1-0x1fff"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details