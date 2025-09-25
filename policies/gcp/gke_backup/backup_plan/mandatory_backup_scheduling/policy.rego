
package terraform.gcp.security.gke_backup.backup_plan.mandatory_backup_scheduling

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "GKE Backup Plan must have scheduled backups configured for automated protection",
            "remedies": ["Add backup_schedule with cron_schedule"]
        },
        {
            "condition": "Checking backup schedule configuration",
            "attribute_path": ["backup_schedule"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details