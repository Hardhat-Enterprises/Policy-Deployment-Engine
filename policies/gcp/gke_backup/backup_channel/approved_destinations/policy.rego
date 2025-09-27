package terraform.gcp.security.gke_backup.google_gke_backup_backup_channel.approved_destinations
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_channel.vars

conditions := [[
  {
    "situation_description": "Backup channel destination is not in an approved project",
    "remedies": ["Set destination_project to an approved organizational project"]
  },
  {
    "condition": "destination_project must be an approved project",
    "attribute_path": ["destination_project"],
    "values": [
      "projects/*/locations/*/clusters/*",
      [["fluent-coder-468700-h4", "your-backup-project", "your-security-project"]]
    ],
    "policy_type": "pattern whitelist"
  }
], [
  {
    "situation_description": "Backup channel location is not in an approved region",
    "remedies": ["Set location to australia-southeast1 or other approved regions"]
  },
  {
    "condition": "location must be in approved regions",
    "attribute_path": ["location"],
    "values": ["australia-southeast1", "australia-southeast2"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details