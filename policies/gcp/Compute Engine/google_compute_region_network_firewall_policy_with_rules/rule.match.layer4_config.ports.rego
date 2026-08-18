package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_match_layer4_config_ports
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars


conditions := [
  [
    {
      "situation_description": "TCP/UDP firewall rules must specify an explicit, bounded port list. Wildcard port list significantly increases the attack surface.",
      "remedies": [
        "Specify an explicit ports list on every TCP and UDP layer4_config block"
      ]
    },
    {
      "condition": "Port list must not use a full-range wildcard",
      "attribute_path": ["rule", 0, "match", 0, "layer4_config", 0, "ports"],
      "values": ["0-65535", "1-65535", "0-65536"],
      "policy_type": "blacklist"
    }
  ]
]

   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
