package terraform.gcp.security.gke_backup.google_gke_backup_restore_channel.location_compliance
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_channel.vars

conditions := [[
  {
    "situation_description": "Restore channel is not in an approved Australian region for data residency compliance",
    "remedies": ["Move restore channel to australia-southeast1 or australia-southeast2"]
  },
  {
    "condition": "location must be in approved Australian regions",
    "attribute_path": ["location"],
    "values": ["australia-southeast1", "australia-southeast2"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details