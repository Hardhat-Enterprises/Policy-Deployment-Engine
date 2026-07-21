package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.destination_configs_destinations_host

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Is the destination host approved",
      "remedies": ["Use only approved destination hosts"]
    },
    {
      "condition": "destination host approved",
      "attribute_path": ["destination_configs.destinations.host"],
      "values": [
        "https://example.atlassian.net"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details