package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.force_update

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.vars

conditions := [
    [
        {
            "situation_description": "Backup vault force_update is enabled, which can override retention conflict protections and allow retention changes that are inconsistent with associated backup plans.",
            "remedies": [
                "Set force_update to false unless there is an approved operational need.",
                "Review backup plan retention settings before changing the backup vault minimum enforced retention.",
                "Use force_update only through an approved exception process with documented justification."
            ]
        },
        {
            "condition": "Check whether force_update is disabled.",
            "attribute_path": ["force_update"],
            "values": [false, null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
