package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.cluster

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must specify a source cluster.",
      "remedies": ["Specify the Kubernetes cluster used by the Backup Plan."]
    },
    {
      "condition": "Cluster must not be empty or null",
      "attribute_path": ["cluster"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
