package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.compute_instance_restore_properties_confidential_instance_config_enable_confidential_compute

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Confidential Compute is not enabled for the restored compute instance.",
            "remedies": [
                "Set enable_confidential_compute to true.",
                "Enable Confidential Compute for workloads requiring stronger memory protection.",
                "Review restore security configuration."
            ]
        },
        {
            "condition": "Check whether Confidential Compute is enabled.",
            "attribute_path": ["compute_instance_restore_properties", 0, "confidential_instance_config", 0, "enable_confidential_compute"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
