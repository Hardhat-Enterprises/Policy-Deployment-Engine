package terraform.gcp.security.gke_backup.backup_plan.comprehensive_namespace_coverage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

situations := [
    [
        {
            "situation_description": "GKE Backup Plan must enable comprehensive namespace coverage to ensure all workloads are protected",
            "remedies": ["Set all_namespaces to true in backup_config"]
        },
        {
            "condition": "Checking backup plan namespace coverage",
            "attribute_path": ["backup_config", 0, "all_namespaces"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details