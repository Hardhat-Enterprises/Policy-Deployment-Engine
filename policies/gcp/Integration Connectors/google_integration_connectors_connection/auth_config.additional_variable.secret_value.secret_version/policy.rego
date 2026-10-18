package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.auth_config_additional_variable_secret_value_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The secret-typed auth variable reference uses the moving 'latest' alias, so a new secret version silently changes what this connection uses while the Terraform configuration stays unchanged.",
      "remedies": [
        "Pin the reference to an explicit secret version number instead of 'latest'."
      ]
    },
    {
      "condition": "auth_config.additional_variable.secret_value.secret_version must not use the 'latest' alias.",
      "attribute_path": ["auth_config", 0, "additional_variable", 0, "secret_value", 0, "secret_version"],
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
