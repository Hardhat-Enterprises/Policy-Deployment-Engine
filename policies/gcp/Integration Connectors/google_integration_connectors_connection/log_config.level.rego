package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.log_config_level

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "Logging runs at DEBUG, so request and response detail including headers and payload content is written into Cloud Logging where a wider set of readers can reach it.",
      "remedies": [
        "Set log_config.level to INFO or ERROR."
      ]
    },
    {
      "condition": "log_config.level must not be DEBUG.",
      "attribute_path": ["log_config", 0, "level"],
      "values": ["DEBUG"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
