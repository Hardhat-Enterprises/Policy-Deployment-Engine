package terraform.gcp.security.gke_backup.backup_plan.persistent_volume_backup_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must include persistent volume data",
        "remedies": ["Set include_volume_data to true in backup_config"],
        "condition": "c1",
        "attribute_path": ["backup_config", 0, "include_volume_data"],
        "values": [true],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details