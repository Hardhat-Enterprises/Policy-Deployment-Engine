package terraform.gcp.security.kuber_engine.google_container_cluster.default_snat_status

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "Default SNAT is not disabled (in-node masquerading still active)",
      "remedies": ["Set default_snat_status.disabled = true"]
    },
    {
      "condition": "Ensure SNAT is disabled for better network control",
      "attribute_path": ["default_snat_status", 0, "disabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
