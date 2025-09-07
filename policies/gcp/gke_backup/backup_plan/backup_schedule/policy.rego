package terraform.gcp.security.gke_backup.backup_plan.backup_schedule
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan has no automated schedule",
            "remedies": ["Configure backup_schedule with appropriate cron_schedule for automated backups"]
        },
        {
            "condition": "Check for backup schedule configuration",
            "attribute_path": ["backup_schedule"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
