package terraform.gcp.security.gke_backup.backup_plan.all_namespaces

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must include all namespaces",
            "remedies": ["Set all_namespaces to true"]
        },
        {
            "condition": "Checking all_namespaces setting",
            "attribute_path": ["backup_config", 0, "all_namespaces"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details