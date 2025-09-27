package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.namespaced_resource_restore_mode

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Namespaced resource restore mode allows resource conflicts",
            "remedies": ["Set namespaced_resource_restore_mode to FAIL_ON_CONFLICT to prevent overwriting", "Use DELETE_AND_RESTORE only when explicitly required"]
        },
        {
            "condition": "c1: namespaced_resource_restore_mode should fail on conflicts",
            "attribute_path": ["restore_config", 0, "namespaced_resource_restore_mode"],
            "values": ["FAIL_ON_CONFLICT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details