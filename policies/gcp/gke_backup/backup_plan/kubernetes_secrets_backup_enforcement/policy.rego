package terraform.gcp.security.gke_backup.backup_plan.kubernetes_secrets_backup_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

situations := [
    [
        {
            "situation_description": "GKE Backup Plan must include secrets for complete security coverage",
            "remedies": ["Set include_secrets to true in backup_config"]
        },
        {
            "condition": "Checking secrets inclusion",
            "attribute_path": ["backup_config", 0, "include_secrets"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details