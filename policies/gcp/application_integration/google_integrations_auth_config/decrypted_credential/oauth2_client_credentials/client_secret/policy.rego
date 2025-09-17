package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential.oauth2_client_credentials.client_secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
  [
    {"situation_description": "Client secret is missing or empty in OAuth2 client credentials block",
     "remedies": ["Provide a non-empty client_secret value in the OAuth2 client_credentials block"]},
    {
      "condition": "Detect if client_secret is null or empty",
      "attribute_path": ["decrypted_credential",0, "oauth2_client_credentials",0, "client_secret"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
