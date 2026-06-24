package terraform.gcp.security.app_engine.google_app_engine_domain_mapping.domain_name

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_domain_mapping.vars

conditions := [
  [
    {
      "situation_description": "Domain mapping is utilising an unapproved domain name",
      "remedies": ["Use an approved domain: 'hardhat.pythonanywhere.com' or 'hardhatenterprises.com'"]
    },
    {
      "condition": "Check domain_name against whitelist",
      "attribute_path": ["domain_name"],
      "values": ["hardhat.pythonanywhere.com", "hardhatenterprises.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details