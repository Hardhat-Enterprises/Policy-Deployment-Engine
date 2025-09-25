package terraform.gcp.security.gke_backup.backup_plan.customer_managed_encryption_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Using blacklist approach - checking for null/missing encryption
conditions := [
    {
        "situation_description": "GKE Backup plan must use customer-managed encryption",
        "remedies": ["Add encryption_key with gcp_kms_encryption_key in backup_config"],
        "condition": "c1",
        "attribute_path": ["backup_config", 0, "encryption_key"],
        "values": [null],
        "policy_type": "blacklist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details