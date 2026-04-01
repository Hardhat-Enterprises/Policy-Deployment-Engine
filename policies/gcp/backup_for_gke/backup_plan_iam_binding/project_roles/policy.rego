package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.project_roles
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan IAM role must not be project-wide admin.",
      "remedies": ["Use more granular roles."]
    },
    {
      "condition": "Role must not be gkebackup.admin or backupAdmin",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.admin", "roles/gkebackup.backupAdmin"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
