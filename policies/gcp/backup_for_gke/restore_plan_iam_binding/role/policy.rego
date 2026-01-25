package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.role
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan IAM role must not be permissive.",
      "remedies": ["Do not use owner, editor, or gkebackup.admin roles."]
    },
    {
      "condition": "Role must not be permissive",
      "attribute_path": ["role"],
      "values": ["roles/owner", "roles/editor", "roles/gkebackup.admin", "roles/iam.securityAdmin", "roles/resourcemanager.organizationAdmin"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
