package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential_oauth2_client_credentials_request_type

import data.terraform.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
    [
        {
            "situation_description": "OAuth2 client credentials request_type is set to QUERY_PARAMETERS or left unspecified, risking credential exposure in server logs, browser history, and referrer headers",
            "remedies": [
                "Set decrypted_credential.oauth2_client_credentials.request_type to ENCODED_HEADER or REQUEST_BODY",
                "Avoid QUERY_PARAMETERS, which exposes client credentials in URLs"
            ]
        },
        {
            "condition": "request_type must be ENCODED_HEADER or REQUEST_BODY",
            "attribute_path": ["decrypted_credential", 0, "oauth2_client_credentials", 0, "request_type"],
            "values": ["REQUEST_BODY", "ENCODED_HEADER"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details