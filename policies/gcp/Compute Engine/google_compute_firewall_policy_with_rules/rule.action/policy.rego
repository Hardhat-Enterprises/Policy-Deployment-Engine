package terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.rule_action

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.vars

conditions := [
  [
    {
      "situation_description": "action is set to allow without matching traffic through a security profile group, meaning this rule permits traffic with no inspection",
      "remedies": [
        "Set action to deny, goto_next, or apply_security_profile_group where inspection is required"
      ]
    },
    {
      "condition": "action should not silently permit uninspected traffic",
      "attribute_path": ["rule", 0, "action"],
      "policy_type": "blacklist",
      "values": ["allow"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details