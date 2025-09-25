package terraform.gcp.security.gke_backup.backup_plan.kubernetes_secrets_backup_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must include Kubernetes secrets",
        "remedies": ["Set include_secrets to true in backup_config"],
        "condition": "c1",
        "attribute_path": ["backup_config", 0, "include_secrets"],
        "values": [true],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details