package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

# Prevent accidental deletion of the data connector
conditions := [
  [
    {
      "situation_description": "Discovery Engine data connectors must enable deletion protection.",
      "remedies": ["Set deletion_policy to PREVENT to avoid accidental deletion."]
    },
    {
      "condition": "Deletion protection not enabled",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]
 

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

