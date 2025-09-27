package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.volume_data_restore_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Volume data restore policy not properly configured",
            "remedies": ["Set volume_data_restore_policy to RESTORE_VOLUME_DATA_FROM_BACKUP or NO_VOLUME_DATA_RESTORATION based on requirements", "Avoid REUSE_VOLUME_HANDLE_FROM_BACKUP unless explicitly required"]
        },
        {
            "condition": "c1: volume_data_restore_policy should be explicitly set",
            "attribute_path": ["restore_config", 0, "volume_data_restore_policy"],
            "values": ["RESTORE_VOLUME_DATA_FROM_BACKUP", "NO_VOLUME_DATA_RESTORATION"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details