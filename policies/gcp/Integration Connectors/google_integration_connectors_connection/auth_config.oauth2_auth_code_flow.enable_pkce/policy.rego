package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.auth_config_oauth2_auth_code_flow_enable_pkce

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The authorization code flow runs without PKCE, so an intercepted authorization code can be exchanged for a token by a party that never initiated the flow.",
      "remedies": [
        "Set enable_pkce to true on the oauth2_auth_code_flow block."
      ]
    },
    {
      "condition": "auth_type must be the authorization code flow.",
      "attribute_path": ["auth_config", 0, "auth_type"],
      "values": ["OAUTH2_AUTH_CODE_FLOW"],
      "policy_type": "whitelist"
    },
    {
      "condition": "enable_pkce must not be off or unset.",
      "attribute_path": ["auth_config", 0, "oauth2_auth_code_flow", 0, "enable_pkce"],
      "values": [false, null],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
