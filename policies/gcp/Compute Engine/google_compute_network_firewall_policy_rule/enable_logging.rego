package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.enable_logging
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "Logging is not enabled, so the traffic is not recorded",
      "remedies": ["Set enable_logging to true so matched traffic is recorded"]
    },
    {
      "condition": "enable_logging is true",
      "attribute_path": ["enable_logging"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details