package terraform.gcp.security.backup_and_dr_service.google_backup_dr_management_server.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_management_server.vars

conditions := [
    [
        {
            "situation_description": "Management server location is not in an approved region, which may violate data residency, governance, or compliance requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Ensure management servers are deployed only in organisation-approved regions.",
                "Review regional deployment requirements before creating the management server."
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