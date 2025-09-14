package terraform.gcp.security.gke_backup.backup_plan.backup_schedule
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "Backup plan must have a scheduled backup",
            "remedies": ["Add backup_schedule with cron_schedule"]
        },
        {
            "condition": "Checking backup schedule is configured",
            "attribute_path": ["backup_schedule"],
            "values": [[]],
=======
            "situation_description": "Backup plan has no automated schedule",
            "remedies": ["Configure backup_schedule with appropriate cron_schedule for automated backups"]
        },
        {
            "condition": "Check for backup schedule configuration",
            "attribute_path": ["backup_schedule"],
            "values": [null, []],
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
<<<<<<< HEAD
details := helpers.get_multi_summary(conditions, vars.variables).details
=======
details := helpers.get_multi_summary(conditions, vars.variables).details
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
