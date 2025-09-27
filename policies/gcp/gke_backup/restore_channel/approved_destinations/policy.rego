package terraform.gcp.security.gke_backup.google_gke_backup_restore_channel.approved_destinations
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_channel.vars

conditions := [[
  {
    "situation_description": "Restore channel destination is not in an approved project",
    "remedies": ["Set destination_project to an approved organizational project"]
  },
  {
    "condition": "destination_project must be an approved project",
    "attribute_path": ["destination_project"],
    "values": [
      "projects/fluent-coder-468700-h4",
      "projects/your-backup-project",
      "projects/your-disaster-recovery-project"
    ],
    "policy_type": "whitelist"
  }
], [
  {
    "situation_description": "Restore channel location is not in approved region",
    "remedies": ["Set location to australia-southeast1 or australia-southeast2"]
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