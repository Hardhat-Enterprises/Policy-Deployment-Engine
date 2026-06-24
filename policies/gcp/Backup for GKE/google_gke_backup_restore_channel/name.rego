package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.name
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
  [
    {
      "situation_description": "Restore Channel name must follow the naming convention.",
      "remedies": ["Name must start with 'gke-restore-channel-'."]
    },
    {
      "condition": "Name must start with gke-restore-channel-",
      "attribute_path": ["name"],
      "values": ["^gke-restore-channel-.*$"],
      "policy_type": "pattern_whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
