package terraform.gcp.security.app_engine.app_engine_application_url_dispatch_rules.dispatch_rules.dispatch_rules_path

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_application_url_dispatch_rules.vars

conditions := [
  [
    {
      "situation_description": "A dispatch rule path is invalid",
      "remedies": ["Ensure that the path begins with a forward slash (e.g., '/', '/*', '/api/*')"]
    },
    {
      "condition": "Check dispatch_rules.path starts with slash",
      "attribute_path": ["dispatch_rules", 0, "path"], 
      "values": ["*/*", [ ["/"], [] ] ], 
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details