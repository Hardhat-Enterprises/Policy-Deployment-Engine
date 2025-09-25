package terraform.gcp.security.app_engine.google_app_engine_firewall_rule.internal_ingress_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_firewall_rule.internal_ingress_only.vars

conditions := [
  [
    {
      "situation_description": "App Engine firewall must not allow ingress from the public internet",
      "remedies": [
        "Remove ALLOW rules that use 0.0.0.0/0",
        "Restrict ALLOW rules to trusted internal CIDR ranges only"
      ]
    },
    {
      "condition": "ALLOW rules with 0.0.0.0/0 are not permitted",
      "attribute_path": ["source_range"],
      "values": ["0.0.0.0/0"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
