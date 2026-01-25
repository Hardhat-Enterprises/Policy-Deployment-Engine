package terraform.gcp.security.backup_for_gke.backup_channel.name
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_channel.vars

conditions := [
  [
    {
      "situation_description": "GKE Backup Channel name must follow naming convention.",
      "remedies": ["Rename to match pattern 'gke-backup-channel-*'."]
    },
    {
      "condition": "Name must match pattern gke-backup-channel-*",
      "attribute_path": ["name"],
      "values": ["c"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
