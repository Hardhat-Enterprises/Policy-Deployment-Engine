package terraform.gcp.security.identity_platform.inbound_saml_config.name_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml_config.vars

conditions := [
  [
    {
      "situation_description": "The 'name' does not conform to the required SAML naming rules.",
      "remedies": [
        "Ensure the name starts with 'saml.', uses only alphanumerics, hyphens, underscores, or dots,",
        "and that the part after 'saml.' starts with a lowercase letter, ends with an alphanumeric character, and is at least 2 characters long."
      ]
    },
    {
      "condition": "Enforce valid naming pattern for 'name'",
      "attribute_path": ["name"],
      "values": ["^saml\\.[a-z][a-z0-9._-]{0,}[a-zA-Z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details