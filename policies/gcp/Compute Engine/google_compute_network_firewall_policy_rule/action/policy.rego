package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.action

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "the request got through the traffic without blocking or inspecting it ",
      "remedies": ["Change action to 'deny' to block the traffic, or 'apply_security_profile_group' to inspecting"]
    },
    {
      "condition": "apply the rule to the client request",
      "attribute_path": ["action"],
      "values": ["allow"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details