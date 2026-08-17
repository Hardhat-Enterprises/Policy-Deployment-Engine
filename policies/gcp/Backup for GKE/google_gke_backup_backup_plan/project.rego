package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.project

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  {
    "condition": "Project must not be empty or null",
    "attribute_path": ["project"],
    "values": ["null", ""],
    "policy_type": "blocklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
