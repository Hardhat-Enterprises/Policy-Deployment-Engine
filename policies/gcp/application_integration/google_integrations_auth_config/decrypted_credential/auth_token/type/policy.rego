package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential.auth_token.type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
  [
    {
      "situation_description": "Insecure auth_token type used",
      "remedies": ["Use 'Bearer' as the auth_token type"]
    },
    {
      "condition": "auth_token type must be Bearer",
      "attribute_path": ["decrypted_credential",0, "auth_token",0, "type"],
      "values": ["Bearer"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
