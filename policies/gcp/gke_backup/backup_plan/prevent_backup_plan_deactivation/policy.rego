package terraform.gcp.security.gke_backup.backup_plan.prevent_backup_plan_deactivation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan is deactivated",
        "remedies": ["Set deactivated to false or remove the deactivated attribute"],
        "condition": "c1",
        "attribute_path": ["deactivated"],
        "values": [false, null],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details