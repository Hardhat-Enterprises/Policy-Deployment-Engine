package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam.role_restriction
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam.vars

conditions := [[
  {
    "situation_description": "IAM role grants excessive permissions for restore operations beyond least privilege",
    "remedies": ["Use least privilege roles like roles/gkebackup.restoreViewer instead of admin roles"]
  },
  {
    "condition": "role must follow least privilege principle for restore operations",
    "attribute_path": ["role"],
    "values": ["roles/gkebackup.restoreViewer"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details