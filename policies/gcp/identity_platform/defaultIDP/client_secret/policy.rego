package terraform.gcp.security.identity_platform.default_supported_idp_config.client_secret_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.default_supported_idp_config.vars

conditions := [
  [
    {
      "situation_description": "The OAuth client_secret is blank or missing, which is not allowed.",
      "remedies": [
        "Provide a valid OAuth client secret string."
      ]
    },
    {
      "condition": "Ensure client_secret is not blank",
      "attribute_path": ["client_secret"],
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details