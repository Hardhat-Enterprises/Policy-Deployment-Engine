package terraform.gcp.security.app_engine.app_engine_application.project

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "App Engine application is being deployed to an invalid project",
      "remedies": ["Set the 'project' attribute to an approved Hardhat Enterprises Project ID"]
    },
    {
      "condition": "Whitelist approved Project IDs",
      "attribute_path": ["project"],
      "values": ["gcp-project-12345"], 
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details