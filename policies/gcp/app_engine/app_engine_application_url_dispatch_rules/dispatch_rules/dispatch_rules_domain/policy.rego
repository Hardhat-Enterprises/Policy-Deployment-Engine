package terraform.gcp.security.app_engine.app_engine_application_url_dispatch_rules.dispatch_rules.dispatch_rules_domain

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_application_url_dispatch_rules.vars

conditions := [
  [
    {
      "situation_description": "Dispatch rule uses an unapproved domain",
      "remedies": ["Set the domain to 'hardhat.pythonanywhere.com' or a '*.hardhatenterprises.com' subdomain"]
    },
    {
      "condition": "Check dispatch_rules.domain",
      "attribute_path": ["dispatch_rules", 0, "domain"], 
      "values": ["hardhat.pythonanywhere.com", "*.hardhatenterprises.com"], 
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details