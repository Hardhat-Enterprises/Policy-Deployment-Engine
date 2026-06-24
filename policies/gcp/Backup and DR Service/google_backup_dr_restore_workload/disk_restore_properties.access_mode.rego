package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.disk_restore_properties_access_mode

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Disk restore access mode is too permissive.",
            "remedies": [
                "Set access_mode to READ_WRITE_SINGLE.",
                "Avoid shared or overly permissive disk access modes unless explicitly approved.",
                "Review restored disk access requirements."
            ]
        },
        {
            "condition": "Check whether access_mode is set to the approved value.",
            "attribute_path": ["disk_restore_properties", 0, "access_mode"],
            "values": ["READ_WRITE_SINGLE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
