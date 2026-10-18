package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.auth_config_user_password_password_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The password reference uses the moving 'latest' alias, so a new secret version changes the credential this connection authenticates with while the Terraform configuration stays unchanged.",
      "remedies": [
        "Pin the reference to an explicit secret version number instead of 'latest'."
      ]
    },
    {
      "condition": "auth_config.user_password.password.secret_version must not use the 'latest' alias.",
      "attribute_path": ["auth_config", 0, "user_password", 0, "password", 0, "secret_version"],
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
