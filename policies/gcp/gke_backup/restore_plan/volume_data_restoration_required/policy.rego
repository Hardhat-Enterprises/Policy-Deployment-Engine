package terraform.gcp.security.gke_backup.restore_plan.volume_data_restoration_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.restore_plan.vars

# Policy to ensure volume data is restored from backups
situations := [
    [
        {
            "situation_description": "Restore plan must restore volume data from backup",
            "remedies": ["Set volume_data_restore_policy to RESTORE_VOLUME_DATA_FROM_BACKUP", "Enable volume data restoration"]
        },
        {
            "condition": "volume_data_restoration_check",
            "attribute_path": ["restore_config", 0, "volume_data_restore_policy"],
            "values": ["NO_VOLUME_DATA_RESTORATION"],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details