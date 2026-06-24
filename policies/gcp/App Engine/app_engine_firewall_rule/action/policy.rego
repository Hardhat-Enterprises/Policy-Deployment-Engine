package terraform.gcp.security.app_engine.app_engine_firewall_rule.action

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_firewall_rule.vars

conditions := [
  [
    {
      "situation_description": "Firewall rule action is not compliant",
      "remedies": ["Set action to 'ALLOW' for this firewall rule"]
    },
    {
      "condition": "Check firewall action is 'ALLOW'",
      "attribute_path": ["action"],
      "values": ["ALLOW"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details