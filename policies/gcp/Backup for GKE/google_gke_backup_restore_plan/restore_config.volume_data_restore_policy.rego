package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_volume_data_restore_policy

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

# Merged policy for `restore_config.volume_data_restore_policy` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
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
  ],
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
