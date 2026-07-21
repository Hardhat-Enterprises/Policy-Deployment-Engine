package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.destination_configs_destinations_port

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Is an approved destination port used",
      "remedies": ["Restrict communication to approved ports"]
    },
    {
      "condition": "destination port approved",
      "attribute_path": ["destination_configs.destinations.port"],
      "values": [
        443
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details