package terraform.gcp.security.kuber_engine.google_container_cluster.cluster_security_controls.enable_integrity_monitoring

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Integrity Monitoring is disabled in shielded_instance_config.",
      "remedies": ["Set node_config.shielded_instance_config.enable_integrity_monitoring = true"]
    },
    {
      "condition": "Integrity Monitoring must be enabled",
      "attribute_path": ["node_config", 0, "shielded_instance_config", 0, "enable_integrity_monitoring"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
