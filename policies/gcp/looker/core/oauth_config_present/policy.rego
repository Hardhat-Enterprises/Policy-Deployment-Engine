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
      "condition": "oauth_config.client_id must be set",
      "attribute_path": ["oauth_config", 0, "client_id"],
      "values": [null, ""], # Violates when missing or empty
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details