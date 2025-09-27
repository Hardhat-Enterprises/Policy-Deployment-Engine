package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.restore_order

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Restore order not defined for predictable restoration",
            "remedies": ["Define restore_order with group_kind_dependencies for consistent restore behavior", "Specify dependencies between resource types"]
        },
        {
            "condition": "c1: restore_order should have dependencies defined",
            "attribute_path": ["restore_config", 0, "restore_order", 0, "group_kind_dependencies"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details