package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.rule_match_dest_region_codes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "the rule targets a destination region that is outside the approved list",
            "remedies": [
                "Restrict rule.match.dest_region_codes to approved regions"
            ]
        },
        {
            "condition": "rule.match.dest_region_codes contains a restricted region",
            "attribute_path": ["rule", 0, "match", 0, "dest_region_codes"],
            "values": ["RU"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details