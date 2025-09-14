package terraform.gcp.security.gke_backup.backup_plan.retention_days
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "Backup retention must be at least 30 days",
            "remedies": ["Set backup_retain_days to at least 30 days"]
        },
        {
            "condition": "Checking backup retention days",
            "attribute_path": ["retention_policy", 0, "backup_retain_days"],
            "values": [30, null],
=======
            "situation_description": "Backup retention period is too short",
            "remedies": ["Set backup_retain_days to at least 7 days for adequate recovery window"]
        },
        {
            "condition": "Check minimum retention days",
            "attribute_path": ["retention_policy", "backup_retain_days"],  # No index needed
            "values": [7, null],
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details