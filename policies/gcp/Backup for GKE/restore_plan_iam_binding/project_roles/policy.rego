package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.project_roles
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan IAM role must not be project-wide admin.",
      "remedies": ["Use more granular roles."]
    },
    {
      "condition": "Role must not be gkebackup.admin or restoreAdmin",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.admin", "roles/gkebackup.restoreAdmin"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
