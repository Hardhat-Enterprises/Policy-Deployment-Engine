package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.eventing_config_auth_config_user_password_password_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The eventing password reference uses the moving 'latest' alias, so a new secret version silently changes the credential the eventing registration authenticates with while the Terraform configuration stays unchanged.",
      "remedies": [
        "Pin the reference to an explicit secret version number instead of 'latest'."
      ]
    },
    {
      "condition": "eventing_config.auth_config.user_password.password.secret_version must not use the 'latest' alias.",
      "attribute_path": ["eventing_config", 0, "auth_config", 0, "user_password", 0, "password", 0, "secret_version"],
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
