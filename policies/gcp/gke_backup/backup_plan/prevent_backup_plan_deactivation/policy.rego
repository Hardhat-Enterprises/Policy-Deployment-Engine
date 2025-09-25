package terraform.gcp.security.gke_backup.backup_plan.prevent_backup_plan_deactivation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

situations := [
    [
        {
            "situation_description": "GKE Backup Plan must remain active for continuous data protection",
            "remedies": ["Set deactivated to false or remove the attribute"]
        },
        {
            "condition": "Checking backup plan is not deactivated",
            "attribute_path": ["deactivated"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details