package terraform.gcp.security.gke_backup.backup_plan.encryption_key
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "Backup plan must use customer-managed encryption",
            "remedies": ["Add encryption_key configuration with gcp_kms_encryption_key"]
        },
        {
            "condition": "Checking encryption key is specified",
            "attribute_path": ["backup_config", 0, "encryption_key"],
            "values": [[]],
=======
            "situation_description": "Backup plan not using customer-managed encryption key",
            "remedies": ["Configure encryption_key with a KMS key for better security control"]
        },
        {
            "condition": "Check for custom encryption key",
            "attribute_path": ["backup_config", "encryption_key"],  # No index needed
            "values": [null, []],
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details