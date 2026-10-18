package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.force_delete

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.vars

conditions := [
    [
        {
            "situation_description": "Force delete is enabled for the backup vault, which can override deletion safeguards and may lead to permanent loss of backup data.",
            "remedies": [
                "Set force_delete to false.",
                "Do not override deletion safeguards unless there is an approved operational exception.",
                "Review backup vault deletion settings before applying changes."
            ]
        },
        {
            "condition": "Check whether force_delete is disabled.",
            "attribute_path": ["force_delete"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
