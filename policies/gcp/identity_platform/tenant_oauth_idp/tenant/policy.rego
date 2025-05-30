package terraform.gcp.security.identity_platform.tenant_oauth_idp_config.tenant_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant_oauth_idp_config.vars


conditions := [

  # Whitelist: tenant must be a non-empty string
  [
    {
      "situation_description": "The tenant field is missing or empty.",
      "remedies": [
        "Set a valid tenant identifier (non-empty string)."
      ]
    },
    {
      "condition": "Ensure tenant is not empty",
      "attribute_path": ["tenant"],
      "values": [".+"],              # Match any non-empty string
      "policy_type": "whitelist"     # Corrected from 'pattern whitelist'
    }
  ]

]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
