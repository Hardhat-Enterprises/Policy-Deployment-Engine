package terraform.gcp.security.gke_backup.backup_plan.deactivated

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "Backup plan is deactivated",
        "remedies": ["Set deactivated to false or remove the attribute"],
        "conditions": [
            {
                "condition": "c1: backup plan is deactivated",
                "attribute_path": ["deactivated"],
                "values": [true],
                "policy_type": "blacklist"
            }
        ]
    }
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details