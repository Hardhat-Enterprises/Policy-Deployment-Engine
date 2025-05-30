package terraform.gcp.security.identity_platform.tenant_oauth_idp_config.issuer_check


import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant_oauth_idp_config.vars

conditions := [

  # Whitelist: issuer must be a non-empty string
  [
    {
      "situation_description": "The issuer field is missing or empty, which is required for a valid OIDC setup.",
      "remedies": [
        "Set a valid issuer URL (e.g., https://edu.deakin.au)."
      ]
    },
    {
      "condition": "Check if issuer is a non-empty string",
      "attribute_path": ["issuer"],
      "values": [".+"],               # Regex-like non-empty string match
      "policy_type": "whitelist"      # Correct policy type
    }
  ]

]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
