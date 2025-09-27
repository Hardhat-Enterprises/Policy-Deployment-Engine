package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.all_namespaces

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [
    [
        {
            "situation_description": "Restore scope not properly defined - must specify all_namespaces or selected_namespaces",
            "remedies": ["Set all_namespaces to true for complete restore", "Or configure selected_namespaces with specific namespaces"]
        },
        {
            "condition": "c1: all_namespaces should be true for comprehensive restore",
            "attribute_path": ["restore_config", 0, "all_namespaces"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details