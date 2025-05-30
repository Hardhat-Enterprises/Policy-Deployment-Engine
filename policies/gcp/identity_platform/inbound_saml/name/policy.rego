package terraform.gcp.security.identity_platform.inbound_saml_config.name_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml_config.vars

conditions := [

  # Blacklist: Disallow invalid or placeholder names
  [
    {
      "situation_description": "The 'name' does not conform to the required SAML naming rules.",
      "remedies": [
        "Ensure the name starts with 'saml.', uses only alphanumerics, hyphens, underscores, or dots.",
        "Also ensure the part after 'saml.' starts with a lowercase letter, ends with an alphanumeric character, and is at least 2 characters long."
      ]
    },
    {
      "condition": "Ensure 'name' is valid and not a placeholder or misformatted",
      "attribute_path": ["name"],
      "values": ["", "-", "saml.", "saml._", "saml.1", "saml.!", "saml.@"],
      "policy_type": "blacklist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
