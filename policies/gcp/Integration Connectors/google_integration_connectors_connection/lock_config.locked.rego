package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.lock_config_locked

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection is not locked, so any pipeline run can alter its authentication, destination or TLS settings without a separate barrier.",
      "remedies": [
        "Add a lock_config block with locked set to true and a reason."
      ]
    },
    {
      "condition": "lock_config.locked must not leave the connection open to modification.",
      "attribute_path": ["lock_config", 0, "locked"],
      "values": [false, null],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
