package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.ssl_config_use_ssl

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection does not negotiate TLS to the target endpoint, so credentials and payloads cross the network in cleartext.",
      "remedies": [
        "Set ssl_config.use_ssl to true."
      ]
    },
    {
      "condition": "ssl_config.use_ssl must not leave transport encryption off or unset.",
      "attribute_path": ["ssl_config", 0, "use_ssl"],
      "values": [false, null],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
