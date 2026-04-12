package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_vault.vars

conditions := [
    [
        {
            "situation_description": "Backup vault location is not in an approved region, which may violate data residency, governance, or compliance requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Ensure backup vaults are created only in organisation-approved locations.",
                "Review backup vault location compatibility with workload and data residency requirements."
            ]
        },
        {
            "condition": "Check whether location is set to an approved Australian region.",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

