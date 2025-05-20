package terraform.gcp.security.kuber_engine.google_container_cluster.gke_security_observability.binary_authorization

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Binary Authorization is not enforced",
      "remedies": ["Set evaluation_mode to PROJECT_SINGLETON_POLICY_ENFORCE"]
    },
    {
      "condition": "Ensure binary_authorization is enforced",
      "attribute_path": ["binary_authorization", 0, "evaluation_mode"],
      "values": ["PROJECT_SINGLETON_POLICY_ENFORCE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
