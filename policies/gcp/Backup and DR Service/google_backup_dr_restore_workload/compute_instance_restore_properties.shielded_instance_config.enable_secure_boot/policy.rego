package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.compute_instance_restore_properties_shielded_instance_config_enable_secure_boot

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Secure Boot is not enabled for the restored compute instance.",
            "remedies": [
                "Set enable_secure_boot to true.",
                "Enable Secure Boot for stronger boot integrity protection.",
                "Review Shielded VM settings."
            ]
        },
        {
            "condition": "Check whether Secure Boot is enabled.",
            "attribute_path": ["compute_instance_restore_properties", 0, "shielded_instance_config", 0, "enable_secure_boot"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
