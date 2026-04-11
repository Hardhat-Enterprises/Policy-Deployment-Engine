package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan location is not in an approved region, which may violate data residency and compliance requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Ensure backup plans are deployed only in organisation-approved regions.",
                "Review regional deployment requirements for Backup and DR resources."
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