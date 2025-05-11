
package terraform.gcp.security.identity_platform.tenant_oauth_idp_config.client_id_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant_oauth_idp_config.vars

conditions := [
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
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
