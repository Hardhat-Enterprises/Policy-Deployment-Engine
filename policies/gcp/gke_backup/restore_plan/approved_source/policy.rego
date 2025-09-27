package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.approved_source
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [[
  {
    "situation_description": "Restore plan references backup from unapproved source project or region",
    "remedies": ["Use backup plans from approved organizational projects in australia-southeast regions only"]
  },
  {
    "condition": "backup_plan must be from approved project pattern",
    "attribute_path": ["backup_plan"],
    "values": [
      "projects/*/locations/australia-southeast*/backupPlans/*",
      [["fluent-coder-468700-h4", "your-backup-project"], ["australia-southeast1", "australia-southeast2"]]
    ],
    "policy_type": "pattern whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details