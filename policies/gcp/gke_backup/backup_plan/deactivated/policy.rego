package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.deactivated

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan is deactivated and will not create backups",
            "remedies": ["Set deactivated to false or remove the attribute", "Ensure backup plans are active for production clusters"]
        },
        {
            "condition": "c1: backup plan must not be deactivated",
            "attribute_path": ["deactivated"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details