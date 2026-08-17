package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  {
    "condition": "Deletion policy must not be empty or null",
    "attribute_path": ["deletion_policy"],
    "values": ["null", ""],
    "policy_type": "blocklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
