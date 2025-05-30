package terraform.gcp.security.identity_platform.default_supported_idp_config.client_secret_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.default_supported_idp_config.vars

conditions := [

  # Blacklist: Disallow blank or missing client_secret
  [
    {
      "situation_description": "The OAuth client_secret is blank or missing, which is not allowed and may break authentication flows.",
      "remedies": [
        "Provide a valid, non-empty OAuth client secret string."
      ]
    },
    {
      "condition": "client_secret must not be blank",
      "attribute_path": ["client_secret"],
      "values": [""],  # This is the blacklisted value
      "policy_type": "blacklist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details