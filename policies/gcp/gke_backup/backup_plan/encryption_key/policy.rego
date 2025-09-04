package terraform.gcp.security.gke_backup.backup_plan.encryption_key
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan not using customer-managed encryption key",
            "remedies": ["Configure encryption_key with a KMS key for better security control"]
        },
        {
            "condition": "Check for custom encryption key",
            "attribute_path": ["backup_config", "encryption_key"],  # No index needed
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details