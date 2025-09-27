package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.all_namespaces

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup scope not properly configured - must include all namespaces or specify selected ones",
            "remedies": ["Set all_namespaces to true for complete cluster backup", "Or configure selected_namespaces with specific namespaces"]
        },
        {
            "condition": "c1: all_namespaces should be true for comprehensive backup",
            "attribute_path": ["backup_config", 0, "all_namespaces"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details