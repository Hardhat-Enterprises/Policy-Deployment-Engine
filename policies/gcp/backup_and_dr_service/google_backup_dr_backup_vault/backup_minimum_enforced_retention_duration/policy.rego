package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.backup_minimum_enforced_retention_duration

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.vars

conditions := [
    [
        {
            "situation_description": "Backup vault minimum enforced retention duration is not set to one of the approved secure values (259200s, 300000s, 432000s, 604800s), which may result in insufficient protection against early deletion or modification of backups.",
            "remedies": [
                "Set backup_minimum_enforced_retention_duration to one of the approved secure values: 259200s, 300000s, 432000s, or 604800s.",
                "Ensure the retention duration aligns with organisational recovery and compliance requirements.",
                "Avoid using retention durations shorter than 259200s (3 days)."
            ]
        },
        {
            "condition": "Check whether backup_minimum_enforced_retention_duration is set to one of the approved values: 259200s, 300000s, 432000s, or 604800s.",
            "attribute_path": ["backup_minimum_enforced_retention_duration"],
            "values": ["259200s", "300000s", "432000s", "604800s"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details