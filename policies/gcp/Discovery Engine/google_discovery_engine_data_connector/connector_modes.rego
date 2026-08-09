package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.connector_modes

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Does the data connector use only the required connector capabilities?",
      "remedies": ["Remove unnecessary connector modes to reduce attack surface and follow least privilege."]
    },
    {
      "condition": "Overly broad connector modes are enabled",
      "attribute_path": ["connector_modes"],
      "values": ["ACTIONS", "FEDERATED", "EUA", "FEDERATED_AND_EUA"],
      "policy_type": "element blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details