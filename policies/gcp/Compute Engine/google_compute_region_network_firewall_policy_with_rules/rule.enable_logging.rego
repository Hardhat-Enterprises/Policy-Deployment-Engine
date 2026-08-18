package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_enable_logging
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars



conditions := [
    [
        {
            "situation_description": "Logging must be enabled.",
            "remedies": [
                "Logging of all firewall rules must be enabled to ensure that if an incident were to occur, security teams are able to respond to it."
            ]
        },
        {
            "condition": "Logging must NOT be disabled.",
            "attribute_path": ["rule", 0, "enable_logging"],
            "values": [TRUE],
            "policy_type": "blacklist"
        }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details