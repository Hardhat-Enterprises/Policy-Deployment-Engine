package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential.auth_token.token

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
  [
    {
      "situation_description": "The token field in auth_token is empty, which is insecure.",
      "remedies": ["Ensure a secure token is provided."]
    },
    {
      "condition": "auth_token.token should not be empty.",
      "attribute_path": ["decrypted_credential", 0, "auth_token",0, "token"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
