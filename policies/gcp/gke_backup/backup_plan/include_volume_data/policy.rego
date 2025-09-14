package terraform.gcp.security.gke_backup.backup_plan.include_volume_data

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must include volume data",
            "remedies": ["Set include_volume_data to true"]
        },
        {
            "condition": "Checking include_volume_data setting",
            "attribute_path": ["backup_config", 0, "include_volume_data"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details