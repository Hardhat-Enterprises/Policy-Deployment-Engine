package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_channel.name
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_channel.vars

conditions := [
  [
    {
      "situation_description": "GKE Backup Channel name must follow naming convention.",
      "remedies": ["Rename to match pattern 'gke-backup-channel-*'."]
    },
    {
      "condition": "Name must match pattern gke-backup-channel-*",
      "attribute_path": ["name"],
      "values": ["^gke-backup-channel-.*"],
      "policy_type": "pattern_whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
