package terraform.gcp.security.gke_backup.backup_plan.comprehensive_namespace_coverage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must enable comprehensive namespace coverage to ensure all workloads are protected",
        "remedies": ["Set all_namespaces to true in backup_config"]
    },
    {
        "condition": "Checking namespace coverage",
        "attribute_path": ["backup_config", 0, "all_namespaces"],
        "values": [true],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details