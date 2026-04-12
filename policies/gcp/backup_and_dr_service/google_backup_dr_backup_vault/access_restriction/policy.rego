package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.access_restriction

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.vars

conditions := [
    [
        {
            "situation_description": "Backup vault access restriction is too permissive and may allow access beyond approved project or organisation boundaries.",
            "remedies": [
                "Set access_restriction to WITHIN_PROJECT or WITHIN_ORGANIZATION.",
                "Avoid using UNRESTRICTED unless there is a formally approved business need.",
                "Review whether broader access is necessary for the backup vault."
            ]
        },
        {
            "condition": "Check whether access_restriction is set to an approved restrictive value.",
            "attribute_path": ["access_restriction"],
            "values": ["WITHIN_PROJECT", "WITHIN_ORGANIZATION"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

