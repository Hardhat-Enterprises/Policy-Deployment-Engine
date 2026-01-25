package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.restore_permissions
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan IAM role must be allowed.",
      "remedies": ["Use roles/gkebackup.viewer or roles/gkebackup.restoreAgent."]
    },
    {
      "condition": "Role must be allowed",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.viewer", "roles/gkebackup.restoreAgent"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
