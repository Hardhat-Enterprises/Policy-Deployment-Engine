package terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.delete_restored_instance

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_restore_workload.vars

conditions := [
    [
        {
            "situation_description": "Restore workload is configured to delete the restored instance during terraform destroy, which increases the risk of accidental data loss.",
            "remedies": [
                "Set delete_restored_instance to false.",
                "Keep restored resources after terraform destroy unless deletion is explicitly required.",
                "Review restore lifecycle settings before applying changes."
            ]
        },
        {
            "condition": "Check whether delete_restored_instance is disabled.",
            "attribute_path": ["delete_restored_instance"],
            "values": [false, null],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details