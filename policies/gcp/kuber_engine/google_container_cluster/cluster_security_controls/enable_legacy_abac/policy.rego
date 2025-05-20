package terraform.gcp.security.kuber_engine.google_container_cluster.cluster_security_controls.enable_legacy_abac

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Legacy ABAC is enabled, which grants overly permissive static access.",
      "remedies": ["Disable enable_legacy_abac (set to false or remove it)"]
    },
    {
      "condition": "Legacy ABAC must be disabled",
      "attribute_path": ["enable_legacy_abac"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
