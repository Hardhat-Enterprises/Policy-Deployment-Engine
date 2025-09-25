package terraform.gcp.security.gke_backup.backup_plan.production_cluster_naming_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Use pattern matching for production naming
conditions := [
    {
        "situation_description": "Production GKE Backup plans must follow naming convention",
        "remedies": ["Name should follow pattern: prod-[region]-[identifier]"],
        "condition": "c1",
        "attribute_path": ["name"],
        "values": ["prod-*-*", [["southeast", "central", "east", "west"], ["backup", "plan", "cluster"]]],
        "policy_type": "pattern whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details