package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.action_config_action_params

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Are action connector parameters configured correctly",
      "remedies": ["Ensure only approved configuration parameters are supplied"]
    },
    {
      "condition": "action parameters are valid",
      "attribute_path": ["action_config.action_params"],
      "values": ["valid-string"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details