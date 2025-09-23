package terraform.gcp.security.container_attached.google_container_attached_cluster.distribution_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars


conditions := [
  [
    {
      "situation_description": "Attached cluster uses a non-approved Kubernetes distribution.",
      "remedies": ["Set 'distribution' to 'aks' or 'eks' or 'generic' only."]
    },
    {
      "condition": "Distribution must be whitelisted",
      "attribute_path": ["distribution"],
      "values": ["aks", "eks", "generic"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
