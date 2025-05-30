package terraform.gcp.security.identity_platform.inbound_saml_config.display_name_check


import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml_config.vars



conditions := [

  # Blacklist: Disallow blank or placeholder display_name values
  [
    {
      "situation_description": "The display_name is blank or contains placeholder text, which reduces configuration clarity.",
      "remedies": [
        "Set a meaningful, human-friendly display_name for the SAML provider.",
        "Avoid using empty strings or placeholders like '-', 'N/A', or 'none'."
      ]
    },
    {
      "condition": "Ensure display_name is meaningful (not empty or placeholder)",
      "attribute_path": ["display_name"],
      "values": ["", "-", "n/a", "N/A", "none", "None", " "],
      "policy_type": "blacklist"
    }
  ]

]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
