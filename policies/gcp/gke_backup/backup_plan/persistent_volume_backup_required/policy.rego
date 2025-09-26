package terraform.gcp.security.gke_backup.backup_plan.persistent_volume_backup_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Policy to ensure persistent volume data is included in backups
situations := [
    [
        {
            "situation_description": "Backup must include persistent volume data",
            "remedies": ["Set include_volume_data to true", "Enable volume data backup"]
        },
        {
            "condition": "volume_data_backup_check",
            "attribute_path": ["backup_config", 0, "include_volume_data"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Backup must include Kubernetes secrets",
            "remedies": ["Set include_secrets to true", "Enable secrets backup"]
        },
        {
            "condition": "secrets_backup_check",
            "attribute_path": ["backup_config", 0, "include_secrets"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details