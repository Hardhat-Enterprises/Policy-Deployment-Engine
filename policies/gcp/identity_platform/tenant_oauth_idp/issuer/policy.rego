
package terraform.gcp.security.identity_platform.tenant_oauth_idp_config.issuer_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant_oauth_idp_config.vars

conditions := [
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
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
