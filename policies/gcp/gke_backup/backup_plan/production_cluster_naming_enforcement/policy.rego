package terraform.gcp.security.gke_backup.backup_plan.production_cluster_naming_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan cluster must follow approved naming patterns for environment identification",
        "remedies": ["Use cluster names with prod- or staging- prefix"]
    },
    {
        "condition": "Checking cluster naming pattern",
        "attribute_path": ["cluster"],
        "values": ["projects/*/locations/*/clusters/prod-*", [["prod", "staging"]]],
        "policy_type": "pattern whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details