package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential.credential_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
  [
    {"situation_description": "Credential type is insecure or deprecated.",
     "remedies": ["Use only approved credential types: username_and_password, oauth2_client_credentials, oauth2_authorization_code, jwt, auth_token, service_account_credentials, oidc_token"]},
    {
      "condition": "Enforce whitelist on credential_type values",
      "attribute_path": ["decrypted_credential",0, "credential_type"],
      "values": ["username_and_password", "oauth2_client_credentials", "oauth2_authorization_code", "jwt", "auth_token", "service_account_credentials", "oidc_token"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
