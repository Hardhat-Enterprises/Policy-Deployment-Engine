package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.log_config_enabled

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection emits no logs, leaving no record of what it did and no audit trail for the integration.",
      "remedies": [
        "Add a log_config block with enabled set to true."
      ]
    },
    {
      "condition": "log_config.enabled must not leave logging off or the block absent.",
      "attribute_path": ["log_config", 0, "enabled"],
      "values": [false, null],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
