package terraform.gcp.security.azurecluster.cluster.kubernetes_version_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.vars

conditions := [
  {
    "situation_description": "Cluster must run an approved Kubernetes version",
    "remedies": ["Use only supported versions like 1.27.x or 1.28.x"],
    "condition": "Unsupported Kubernetes version",
    "attribute_path": ["control_plane", 0, "version"],
    "values": ["1.27.3", "1.28.1", "1.28.2"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail  := summary.details
