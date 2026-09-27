package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.ssl_config_trust_model

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection does not validate the certificate presented by the target endpoint, so it cannot confirm it is talking to the intended service.",
      "remedies": [
        "Set ssl_config.trust_model to PUBLIC for endpoints with a publicly trusted certificate, or PRIVATE with a private_server_certificate supplied."
      ]
    },
    {
      "condition": "ssl_config.trust_model must not disable certificate trust validation.",
      "attribute_path": ["ssl_config", 0, "trust_model"],
      "values": ["INSECURE"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
