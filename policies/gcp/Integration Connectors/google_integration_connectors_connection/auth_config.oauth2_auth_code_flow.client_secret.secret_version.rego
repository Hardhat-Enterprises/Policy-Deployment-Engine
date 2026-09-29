package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.auth_config_oauth2_auth_code_flow_client_secret_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The OAuth2 client secret reference uses the moving 'latest' alias, so a new secret version silently changes what this connection uses while the Terraform configuration stays unchanged.",
      "remedies": [
        "Pin the reference to an explicit secret version number instead of 'latest'."
      ]
    },
    {
      "condition": "auth_config.oauth2_auth_code_flow.client_secret.secret_version must not use the 'latest' alias.",
      "attribute_path": ["auth_config", 0, "oauth2_auth_code_flow", 0, "client_secret", 0, "secret_version"],
      "values": [
        "projects/*/secrets/*/versions/*",
        [[], [], ["latest"]]
      ],
      "policy_type": "pattern blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
