package terraform.gcp.security.app_engine.app_engine_application_url_dispatch_rules.dispatch_rules.dispatch_rules_service

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_application_url_dispatch_rules.vars

conditions := [
  [
    {
      "situation_description": "Dispatch rule routes traffic to an unapproved service",
      "remedies": ["Set dispatch_rules.service to an approved service (e.g. 'default' or 'admin')"]
    },
    {
      "condition": "Check that dispatch_rules.service is whitelisted",
      "attribute_path": ["dispatch_rules", 0, "service"], 
      "values": ["default", "admin", "api-gateway"], 
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details