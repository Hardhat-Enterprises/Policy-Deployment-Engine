package terraform.gcp.security.gke_backup.backup_plan.comprehensive_namespace_coverage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must include all namespaces for comprehensive coverage",
        "remedies": ["Set all_namespaces to true in backup_config"],
        "condition": "c1",
        "attribute_path": ["backup_config", 0, "all_namespaces"],
        "values": [true],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details