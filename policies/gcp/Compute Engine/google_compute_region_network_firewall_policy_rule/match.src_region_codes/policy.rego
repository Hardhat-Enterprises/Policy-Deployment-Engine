package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.match_src_region_codes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "Firewall rule does not constrain source geography, so source region filtering is not applied.",
            "remedies": [
                "Set match.src_region_codes to a non-empty list of approved ISO country codes."
            ]
        },
        {
            "condition": "Check if src_region_codes is set to a non-empty list",
            "attribute_path": ["match", 0, "src_region_codes"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
