package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.backup_minimum_enforced_retention_duration

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.vars

conditions := [
    [
        {
            "situation_description": "Backup vault minimum enforced retention duration is too short and may not provide sufficient protection against early deletion or modification of backups.",
            "remedies": [
                "Set backup_minimum_enforced_retention_duration to at least 259200s (3 days).",
                "Ensure the enforced retention duration aligns with organisational recovery and compliance requirements.",
                "Review backup vault retention settings before creating or updating the vault."
            ]
        },
        {
            "condition": "Check whether backup_minimum_enforced_retention_duration is at least 259200s (3 days).",
            "attribute_path": ["backup_minimum_enforced_retention_duration"],
            "values": ["259200s", null],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
