package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.env_vars_encrypted

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.env_vars_encrypted.vars

conditions := [
  [
    {"situation_description" : "Sensitive environment variables are not sourced from Secret Manager.",
     "remedies": [ "Use Secret Manager via 'env_variables.SECRET_SOURCE'" ]},
    {
      "condition": "Ensure sensitive environment variables are encrypted via Secret Manager",
      "attribute_path": ["env_variables", "SECRET_SOURCE"],
      "values": ["projects/*/secrets/*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
