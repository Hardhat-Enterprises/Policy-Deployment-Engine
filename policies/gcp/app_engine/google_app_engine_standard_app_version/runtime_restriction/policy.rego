package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.runtime_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.runtime_restriction.vars

# Allow only a defined set of secure/approved runtimes
# For example: python39, nodejs18, go119, etc.

conditions := [
  [
    {"situation_description" : "An unapproved runtime is being used",
     "remedies": [ 
        "Use an approved runtime like python39, nodejs18, or go119" 
     ]},
    {
      "condition": "Runtime must be in allowed list",
      "attribute_path": ["runtime"],
      "values": ["python3.9", "nodejs18", "go119", "java17"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
