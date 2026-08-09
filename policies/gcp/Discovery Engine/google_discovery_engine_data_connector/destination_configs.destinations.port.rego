package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.destination_configs_destinations_port

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Is the destination configured with an approved network port?",
      "remedies": ["Use an approved destination port such as 443, 8443, or 9443."]
    },
    {
      "condition": "Destination port is not approved",
      "attribute_path": ["destination_configs", 0, "destinations", 0, "port"],
      "values": [443, 8443, 9443],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details