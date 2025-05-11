package terraform.gcp.security.identity_platform.inbound_saml_config.display_name_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml_config.vars

conditions := [
  [
    {
      "situation_description": "The display_name is blank, which is not allowed.",
      "remedies": [
        "Provide a meaningful, human-friendly name for the SAML provider."
      ]
    },
    {
      "condition": "Ensure display_name is not blank",
      "attribute_path": ["display_name"],
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details