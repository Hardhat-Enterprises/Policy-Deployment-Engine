package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.custom_roles
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Custom roles should not be used in Backup Plan IAM.",
      "remedies": ["Use predefined roles instead of custom roles."]
    },
    {
      "condition": "Role must not be a custom role",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.backupViewer", "roles/gkebackup.admin", "roles/gkebackup.viewer", "roles/iam.serviceAccountUser"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
