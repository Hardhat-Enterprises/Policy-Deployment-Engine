package terraform.gcp.security.identity_platform.default_supported_idp_config.client_id_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.default_supported_idp_config.vars

conditions := [
  [
    {
      "situation_description": "The OAuth client_id is missing or blank.",
      "remedies": [
        "Provide a valid OAuth client ID."
      ]
    },
    {
      "condition": "Ensure client_id is not blank",
      "attribute_path": ["client_id"],
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details