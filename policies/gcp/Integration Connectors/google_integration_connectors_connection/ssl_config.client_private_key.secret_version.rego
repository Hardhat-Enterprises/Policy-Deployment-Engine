package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.ssl_config_client_private_key_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The mTLS client private key reference uses the moving 'latest' alias, so a new secret version silently changes what this connection uses while the Terraform configuration stays unchanged.",
      "remedies": [
        "Pin the reference to an explicit secret version number instead of 'latest'."
      ]
    },
    {
      "condition": "ssl_config.client_private_key.secret_version must not use the 'latest' alias.",
      "attribute_path": ["ssl_config", 0, "client_private_key", 0, "secret_version"],
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
