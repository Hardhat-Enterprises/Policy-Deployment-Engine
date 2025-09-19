package terraform.gcp.security.container_attached.container_attached_cluster.location_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.container_attached.container_attached_cluster.vars

conditions := [
  [
    {
      "situation_description": "Attached cluster is created outside the approved region.",
      "remedies": ["Use location 'australia-southeast1' or 'australia-southeast2' only."]
    },
    {
      "condition": "Location must be whitelisted",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
