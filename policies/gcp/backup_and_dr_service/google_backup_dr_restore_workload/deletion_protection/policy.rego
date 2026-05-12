package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Deletion protection is not enabled for the restored compute instance.",
            "remedies": [
                "Set deletion_protection to true.",
                "Enable deletion protection to reduce accidental deletion risk.",
                "Review restore lifecycle protections."
            ]
        },
        {
            "condition": "Check whether deletion_protection is enabled.",
            "attribute_path": ["compute_instance_restore_properties", 0, "deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
