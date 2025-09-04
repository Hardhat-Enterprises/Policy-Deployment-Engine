package terraform.gcp.security.gke_backup.backup_plan.include_secrets
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan does not include secrets",
            "remedies": ["Enable include_secrets to ensure complete backup of application state"]
        },
        {
            "condition": "Check if secrets are included in backup",
            "attribute_path": ["backup_config", "include_secrets"],  # Remove the array index
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details