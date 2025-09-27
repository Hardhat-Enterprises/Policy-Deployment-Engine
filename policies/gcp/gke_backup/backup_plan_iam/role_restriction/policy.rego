package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan_iam.role_restriction
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan_iam.vars

conditions := [[
  {
    "situation_description": "IAM role grants excessive permissions beyond least privilege",
    "remedies": ["Use least privilege roles like roles/gkebackup.viewer or roles/gkebackup.restoreViewer"]
  },
  {
    "condition": "role must follow least privilege principle",
    "attribute_path": ["role"],
    "values": ["roles/gkebackup.viewer", "roles/gkebackup.restoreViewer"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details