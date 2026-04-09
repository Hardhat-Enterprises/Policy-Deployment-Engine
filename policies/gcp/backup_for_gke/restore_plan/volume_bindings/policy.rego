package terraform.gcp.security.backup_for_gke.restore_plan.volume_bindings
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plans must ensure volume data is restored from backup.",
      "remedies": ["Set volume_data_restore_policy to 'RESTORE_VOLUME_DATA_FROM_BACKUP'."]
    },
    {
      "condition": "volume_data_restore_policy must be RESTORE_VOLUME_DATA_FROM_BACKUP",
      "attribute_path": ["restore_config", 0, "volume_data_restore_policy"],
      "values": ["RESTORE_VOLUME_DATA_FROM_BACKUP"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
