package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential.oauth2_client_credentials.request_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
  [
    {"situation_description": "OAuth2 request_type is insecure or unspecified",
     "remedies": ["Use 'ENCODED_HEADER' or 'REQUEST_BODY' for better security"]},
    {
      "condition": "Detect if request_type is QUERY_PARAMETERS or unspecified",
      "attribute_path": ["decrypted_credential",0, "oauth2_client_credentials",0, "request_type"],
      "values": ["QUERY_PARAMETERS", "REQUEST_TYPE_UNSPECIFIED"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
