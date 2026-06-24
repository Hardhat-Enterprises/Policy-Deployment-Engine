package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.enable_vtpm

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "vTPM is not enabled for the restored compute instance.",
            "remedies": [
                "Set enable_vtpm to true.",
                "Enable vTPM to strengthen trusted boot and attestation support.",
                "Review Shielded VM settings."
            ]
        },
        {
            "condition": "Check whether vTPM is enabled.",
            "attribute_path": ["compute_instance_restore_properties", 0, "shielded_instance_config", 0, "enable_vtpm"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
