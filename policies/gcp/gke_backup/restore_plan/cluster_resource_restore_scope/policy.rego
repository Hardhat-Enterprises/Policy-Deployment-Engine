package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.cluster_resource_restore_scope

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Cluster resource restore scope not defined or too permissive",
            "remedies": ["Define specific cluster resources to restore", "Avoid restoring all cluster resources unless required"]
        },
        {
            "condition": "c1: no_group_kinds should be false to allow cluster resource restore",
            "attribute_path": ["restore_config", 0, "cluster_resource_restore_scope", 0, "no_group_kinds"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details