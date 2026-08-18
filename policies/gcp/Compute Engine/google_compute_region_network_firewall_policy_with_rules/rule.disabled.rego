package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_disabled
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars

conditions := [
    [
        {
            "situation_description": "Firewall rule is disabled, traffic are not being filtered.",
            "remedies": [
                "Change or delete the rule and don't create firewall rule with the default state being disabled."
            ]
        },
        {
            "condition": "Firewall Rule must NOT be disabled.",
            "attribute_path": ["rule", 0, "disabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
