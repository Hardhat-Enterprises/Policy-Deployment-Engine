package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Restore workload location is not in an approved region, which may violate data residency, governance, or compliance requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Ensure restore workloads are created only in organisation-approved regions.",
                "Review regional deployment requirements before restoring workloads."
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