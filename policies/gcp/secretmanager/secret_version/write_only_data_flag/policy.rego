package terraform.gcp.security.secretmanager.secret_version.write_only_data_flag

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_version.vars

conditions := [
  [
    {
      "situation_description": "Secret version exposes sensitive data using secret_data instead of secret_data_wo",
      "remedies": ["Use secret_data_wo to avoid storing sensitive values in Terraform state"]
    },
    {
      "condition": "Avoid secret_data and prefer write-only secret_data_wo",
      "attribute_path": ["secret_data"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
