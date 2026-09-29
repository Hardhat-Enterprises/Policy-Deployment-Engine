package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Restore Plan location is not in an approved region, which may violate data residency and compliance requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Ensure Restore Plans are deployed only in organisation-approved regions."
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