package terraform.gcp.security.kuber_engine.google_container_cluster.addons_config.network_policy_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Network Policy Addon is disabled, reducing control over traffic flow and isolation.",
      "remedies": ["Set network_policy_config.disabled = false"]
    },
    {
      "condition": "Network Policy must be enabled",
      "attribute_path": ["addons_config", 0, "network_policy_config", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
