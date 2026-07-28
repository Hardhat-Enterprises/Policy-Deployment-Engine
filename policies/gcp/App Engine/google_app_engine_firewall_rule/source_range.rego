package terraform.gcp.security.app_engine.google_app_engine_firewall_rule.source_range

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_firewall_rule.vars

conditions := [
  [
    {
      "situation_description": "Firewall rule allows traffic from all sources (*)",
      "remedies": ["Replace '*' with a specific CIDR range (such as '192.168.1.0/24' or '1.2.3.4/32')"]
    },
    {
      "condition": "Block wildcard source ranges",
      "attribute_path": ["source_range"],
      "values": ["*"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details