package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.include_secrets

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Kubernetes secrets are not included in backups",
            "remedies": ["Set include_secrets to true to backup Kubernetes secrets", "Ensure complete backup coverage including secrets"]
        },
        {
            "condition": "c1: include_secrets should be true",
            "attribute_path": ["backup_config", 0, "include_secrets"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details