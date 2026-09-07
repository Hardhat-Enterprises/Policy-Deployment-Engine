package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.enable_logging
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

conditions := [
  [
    {
      "situation_description": "enable_logging is not set to true, which means traffic matching this rule is not logged to Stackdriver",
      "remedies": [
        "Set enable_logging to true so matching traffic is logged for auditing and incident detection"
      ]
    },
    {
      "condition": "enable_logging must be true",
      "attribute_path": ["enable_logging"],
      "policy_type": "whitelist",
      "values": [true]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
