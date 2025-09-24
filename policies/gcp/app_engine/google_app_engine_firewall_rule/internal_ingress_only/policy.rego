package terraform.gcp.security.app_engine.google_app_engine_firewall_rule.internal_ingress_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_firewall_rule.internal_ingress_only.vars

# Only allow internal IP ranges (e.g. 10.0.0.0/8, 192.168.0.0/16) and deny everything else.

conditions := [
  [
    {"situation_description" : "Public access is allowed to App Engine via firewall rules",
     "remedies": [ "Create deny rule for 0.0.0.0/0", "Only allow internal IP ranges"]},
    {
      "condition": "App Engine should not allow ingress from all (0.0.0.0/0)",
      "attribute_path": ["source_range"],
      "values": ["0.0.0.0/0"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description" : "Internal access is not explicitly allowed",
     "remedies": [ "Add allow rule for internal CIDR blocks like 10.0.0.0/8"]},
    {
      "condition": "App Engine should allow internal IP ranges explicitly",
      "attribute_path": ["source_range"],
      "values": ["10.0.0.0/8", "192.168.0.0/16"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
