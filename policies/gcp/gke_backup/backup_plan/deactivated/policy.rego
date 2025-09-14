package terraform.gcp.security.gke_backup.backup_plan.deactivated

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must not be deactivated",
            "remedies": ["Set deactivated to false or remove the attribute"]
        },
        {
            "condition": "Checking deactivated status",
            "attribute_path": ["deactivated"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details