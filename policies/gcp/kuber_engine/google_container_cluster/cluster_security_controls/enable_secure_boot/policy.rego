package terraform.gcp.security.kuber_engine.google_container_cluster.cluster_security_controls.enable_secure_boot

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Secure Boot is disabled in node_config.shielded_instance_config.",
      "remedies": ["Set node_config.shielded_instance_config.enable_secure_boot = true"]
    },
    {
      "condition": "Secure Boot must be enabled",
      "attribute_path": ["node_config", 0, "shielded_instance_config", 0, "enable_secure_boot"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
