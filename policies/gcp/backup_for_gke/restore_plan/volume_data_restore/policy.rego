package terraform.gcp.security.backup_for_gke.restore_plan.volume_data_restore
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan volume data restore policy must be safe.",
      "remedies": ["Set volume_data_restore_policy to RESTORE_VOLUME_DATA_FROM_BACKUP or NO_VOLUME_DATA_RESTORATION."]
    },
    {
      "condition": "Volume data restore policy must be safe",
      "attribute_path": ["restore_config", 0, "volume_data_restore_policy"],
      "values": ["RESTORE_VOLUME_DATA_FROM_BACKUP", "NO_VOLUME_DATA_RESTORATION"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
