package terraform.gcp.security.looker.core.oauth_config_present
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "OAuth configuration is required but not present",
      "remedies": [
        "Configure oauth_config block with client_id and client_secret",
        "Set up OIDC/SAML/OAuth integration for interactive authentication",
        "Ensure proper authentication flow is configured"
      ]
    },
    {
      "condition": "Require OAuth configuration (whitelist: oauthConfig object must be present)",
      "attribute_path": ["oauth_config", 0, "client_id"],
      "values": ["test-client-id"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
