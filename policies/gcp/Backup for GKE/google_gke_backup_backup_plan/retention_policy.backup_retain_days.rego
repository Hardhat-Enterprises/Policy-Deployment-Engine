package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.retention_policy_backup_retain_days
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan retention days must be between 7 and 90.",
      "remedies": ["Set retention_policy.backup_retain_days to a value between 7 and 90."]
    },
    {
      "condition": "Retention days must be between 7 and 90",
      "attribute_path": ["retention_policy", 0, "backup_retain_days"],
      "values": [7, 90],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
