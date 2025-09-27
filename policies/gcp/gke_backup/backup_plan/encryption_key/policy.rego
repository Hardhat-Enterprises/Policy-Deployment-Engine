package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.encryption_key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup encryption not using customer-managed keys (CMEK)",
            "remedies": ["Configure encryption_key with a Cloud KMS key", "Use customer-managed encryption keys for sensitive data"]
        },
        {
            "condition": "c1: encryption key should not be empty",
            "attribute_path": ["backup_config", 0, "encryption_key", 0, "gcp_kms_encryption_key"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details