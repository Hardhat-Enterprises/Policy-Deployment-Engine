package terraform.gcp.security.gke_backup.backup_plan.persistent_volume_backup_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

situations := [
    [
        {
            "situation_description": "GKE Backup Plan must include volume data for complete data protection",
            "remedies": ["Set include_volume_data to true in backup_config"]
        },
        {
            "condition": "Checking volume data inclusion",
            "attribute_path": ["backup_config", 0, "include_volume_data"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details