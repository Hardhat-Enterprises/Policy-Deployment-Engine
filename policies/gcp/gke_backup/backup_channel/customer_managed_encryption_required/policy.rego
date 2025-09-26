package terraform.gcp.security.gke_backup.backup_channel.customer_managed_encryption_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_channel.vars

# Policy to ensure backup channels use customer-managed encryption
situations := [
    [
        {
            "situation_description": "Backup channel must use customer-managed encryption for security compliance",
            "remedies": ["Add crypto_key_name configuration", "Specify KMS encryption key", "Enable customer-managed encryption"]
        },
        {
            "condition": "encryption_key_check",
            "attribute_path": ["crypto_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details