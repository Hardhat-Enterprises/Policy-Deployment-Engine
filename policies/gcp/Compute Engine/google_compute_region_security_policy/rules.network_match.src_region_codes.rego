package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_network_match_src_region_codes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The network security rule permits traffic from an unapproved source region.",
            "remedies": [
                "Restrict rules.network_match.src_region_codes to approved countries, such as AU."
            ]
        },
        {
            "condition": "Source region codes must be restricted to approved countries",
            "attribute_path": ["rules", 0, "network_match", 0, "src_region_codes"],
            "values": ["AU"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details