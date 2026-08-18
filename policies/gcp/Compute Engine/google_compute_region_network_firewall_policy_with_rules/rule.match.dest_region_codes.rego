package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_match_dest_region_codes
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars

conditions := [
    [
        {
            "situation_description": "Destination region codes must be in Australia",
            "remedies": [
                "Ensure that only approved countires are selected."
            ]
        },
        {
            "condition": "An approved country must be used.",
            "attribute_path": ["rule", 0, "match", 0, "dest_region_codes"],
            "values": ["AU","NZ"],
            "policy_type": "whitelist"
        }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
