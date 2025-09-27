package terraform.gcp.security.gke_backup.google_gke_backup_backup_channel.location_compliance
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_channel.vars

conditions := [[
  {
    "situation_description": "Backup channel is not in an approved Australian region for data residency compliance",
    "remedies": ["Move backup channel to australia-southeast1 or australia-southeast2"]
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