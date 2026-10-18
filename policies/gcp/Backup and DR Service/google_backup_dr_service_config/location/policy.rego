package terraform.gcp.security.backup_and_dr_service.google_backup_dr_service_config.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_service_config.vars

conditions := [
    [
        {
            "situation_description": "Service config location is not in an approved region, which may violate data residency, governance, or compliance requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Ensure Backup and DR service configs are created only in organisation-approved regions.",
                "Review regional deployment requirements before configuring the service."
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

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
