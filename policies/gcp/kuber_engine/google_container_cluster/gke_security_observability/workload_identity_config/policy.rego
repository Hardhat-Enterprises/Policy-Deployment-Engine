package terraform.gcp.security.kuber_engine.google_container_cluster.gke_security_observability.workload_identity_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Workload Identity Pool is misconfigured",
      "remedies": ["Set workload_pool to a valid value like <project_id>.svc.id.goog"]
    },
    {
      "condition": "Ensure workload_identity_config uses valid workload pool",
      "attribute_path": ["workload_identity_config", 0, "workload_pool"],
      "values": [["endsWith", ".svc.id.goog"]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
