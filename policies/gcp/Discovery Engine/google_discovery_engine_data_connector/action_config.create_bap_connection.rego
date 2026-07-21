package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.action_config_create_bap_connection

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Should Business Application Platform connections be created",
      "remedies": ["Disable unless explicitly required"]
    },
    {
      "condition": "create_bap_connection disabled",
      "attribute_path": ["action_config.create_bap_connection"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details