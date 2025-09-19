package terraform.gcp.security.gke_backup.backup_plan.customer_managed_encryption_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "GKE Backup plan must use customer-managed encryption keys for enhanced security",
            "remedies": ["Specify gcp_kms_encryption_key in backup_config encryption_key block"]
        },
        {
            "condition": "Checking customer-managed encryption key",
            "attribute_path": ["backup_config", 0, "encryption_key", 0, "gcp_kms_encryption_key"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details