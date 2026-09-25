package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.retention_policy_backup_delete_lock_days
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan delete lock days must be between 14 and 90.",
      "remedies": ["Set retention_policy.backup_delete_lock_days to a value between 14 and 90."]
    },
    {
      "condition": "Backup delete lock days must be between 14 and 90",
      "attribute_path": ["retention_policy", 0, "backup_delete_lock_days"],
      "values": [14, 90],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
