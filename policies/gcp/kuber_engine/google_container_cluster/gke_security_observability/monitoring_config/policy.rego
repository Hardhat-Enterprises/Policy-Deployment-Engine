package terraform.gcp.security.kuber_engine.google_container_cluster.gke_security_observability.monitoring_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Monitoring is missing SYSTEM_COMPONENTS, APISERVER or CONTROLLER_MANAGER",
      "remedies": ["Enable SYSTEM_COMPONENTS, APISERVER, and CONTROLLER_MANAGER in monitoring_config"]
    },
    {
      "condition": "Ensure monitoring_config includes required components",
      "attribute_path": ["monitoring_config", 0, "enable_components"],
      "values": ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
