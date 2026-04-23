package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.can_ip_forward

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Restored compute instance allows IP forwarding, which increases network exposure.",
            "remedies": [
                "Set can_ip_forward to false.",
                "Disable IP forwarding unless there is an approved networking requirement.",
                "Review restored instance networking settings."
            ]
        },
        {
            "condition": "Check whether can_ip_forward is disabled.",
            "attribute_path": ["compute_instance_restore_properties", 0, "can_ip_forward"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
