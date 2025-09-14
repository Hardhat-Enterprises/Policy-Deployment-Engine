package terraform.gcp.security.gke_backup.backup_plan.encryption_key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must use customer-managed encryption",
            "remedies": ["Add encryption_key configuration with gcp_kms_encryption_key"]
        },
        {
            "condition": "Checking encryption key is specified",
            "attribute_path": ["backup_config", 0, "encryption_key"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details