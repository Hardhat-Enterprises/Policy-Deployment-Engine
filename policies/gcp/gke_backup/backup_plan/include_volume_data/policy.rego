package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.include_volume_data

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Persistent volume data is not included in backups",
            "remedies": ["Set include_volume_data to true to backup PVC data", "Ensure complete backup coverage including persistent volumes"]
        },
        {
            "condition": "c1: include_volume_data should be true",
            "attribute_path": ["backup_config", 0, "include_volume_data"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details