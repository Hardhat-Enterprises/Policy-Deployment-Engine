package terraform.gcp.security.secret_version.write_only_data_flag

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret_version.vars

conditions := [
  [
    {
      "situation_description": "Secret version stores plaintext data instead of using write-only attributes",
      "remedies": ["Use write-only fields like secret_data_wo to avoid exposing plaintext values"]
    },
    {
      "condition": "Ensure secret_data is not present",
      "attribute_path": ["secret_data"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
