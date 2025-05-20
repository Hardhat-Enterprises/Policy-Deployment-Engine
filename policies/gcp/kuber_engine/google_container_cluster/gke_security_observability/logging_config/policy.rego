package terraform.gcp.security.kuber_engine.google_container_cluster.gke_security_observability.logging_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Logging is not configured properly (missing SYSTEM_COMPONENTS or APISERVER)",
      "remedies": ["Enable SYSTEM_COMPONENTS and APISERVER in logging_config"]
    },
    {
      "condition": "Ensure logging_config includes SYSTEM_COMPONENTS and APISERVER",
      "attribute_path": ["logging_config", 0, "enable_components"],
      "values": ["SYSTEM_COMPONENTS", "APISERVER"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
