package terraform.gcp.security.app_engine.google_app_engine_firewall_rule.priority

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_firewall_rule.vars

conditions := [
  [
    {
      "situation_description": "Firewall rule priority is not within approved range",
      "remedies": ["Set the priority to a value between 1 and 2,147,483,646"]
    },
    {
      "condition": "Check firewall rule priority is within approved range",
      "attribute_path": ["priority"],
      "values": [1, 2147483646],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details