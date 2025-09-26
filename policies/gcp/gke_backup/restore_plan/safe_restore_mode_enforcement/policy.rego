package terraform.gcp.security.gke_backup.restore_plan.safe_restore_mode_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.restore_plan.vars

# Policy to enforce safe restore modes
situations := [
    [
        {
            "situation_description": "Restore plan must use safe restore mode to avoid data loss",
            "remedies": ["Use DELETE_AND_RESTORE mode", "Avoid FAIL_ON_CONFLICT mode", "Ensure safe restoration process"]
        },
        {
            "condition": "unsafe_restore_mode_check",
            "attribute_path": ["restore_config", 0, "namespaced_resource_restore_mode"],
            "values": ["FAIL_ON_CONFLICT"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Cluster resource conflicts should use backup version for consistency",
            "remedies": ["Set cluster_resource_conflict_policy to USE_BACKUP_VERSION", "Ensure backup data takes precedence"]
        },
        {
            "condition": "cluster_conflict_policy_check",
            "attribute_path": ["restore_config", 0, "cluster_resource_conflict_policy"],
            "values": ["USE_EXISTING_VERSION"],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details