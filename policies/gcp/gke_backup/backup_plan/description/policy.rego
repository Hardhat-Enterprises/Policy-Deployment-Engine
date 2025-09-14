package terraform.gcp.security.gke_backup.backup_plan.description

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must have a description",
            "remedies": ["Add a meaningful description"]
        },
        {
            "condition": "Checking description is present",
            "attribute_path": ["description"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details