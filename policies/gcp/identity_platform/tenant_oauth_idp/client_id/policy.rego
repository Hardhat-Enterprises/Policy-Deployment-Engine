package terraform.gcp.security.identity_platform.tenant_oauth_idp_config.client_id_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant_oauth_idp_config.vars

conditions := [

  # Whitelist: client_id must be a non-empty string
  [
    {
      "situation_description": "The client_id field is empty, which is not allowed for OAuth setup.",
      "remedies": [
        "Provide a valid client ID for the OAuth configuration."
      ]
    },
    {
      "condition": "Check if client_id is a non-empty string",
      "attribute_path": ["client_id"],
      "values": [".+"],               # Regex-like match for any non-empty string
      "policy_type": "whitelist"      # Correct policy type for this usage
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
