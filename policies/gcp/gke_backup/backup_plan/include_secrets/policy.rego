package terraform.gcp.security.gke_backup.backup_plan.include_secrets
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "Backup plan must include secrets",
            "remedies": ["Set include_secrets to true"]
        },
        {
            "condition": "Checking include_secrets setting",
            "attribute_path": ["backup_config", 0, "include_secrets"],
            "values": [true],
            "policy_type": "whitelist"
=======
            "situation_description": "Backup plan does not include secrets",
            "remedies": ["Enable include_secrets to ensure complete backup of application state"]
        },
        {
            "condition": "Check if secrets are included in backup",
            "attribute_path": ["backup_config", "include_secrets"],  # Remove the array index
            "values": [false],
            "policy_type": "blacklist"
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details