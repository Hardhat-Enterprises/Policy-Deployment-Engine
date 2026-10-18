package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.compute_instance_restore_properties_shielded_instance_config_enable_integrity_monitoring

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Integrity monitoring is not enabled for the restored compute instance.",
            "remedies": [
                "Set enable_integrity_monitoring to true.",
                "Enable integrity monitoring to detect boot integrity changes.",
                "Review Shielded VM settings."
            ]
        },
        {
            "condition": "Check whether integrity monitoring is enabled.",
            "attribute_path": ["compute_instance_restore_properties", 0, "shielded_instance_config", 0, "enable_integrity_monitoring"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
