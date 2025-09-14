package terraform.gcp.security.gke_backup.backup_plan.cluster_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan cluster must follow naming pattern",
            "remedies": ["Use cluster names with prod- or staging- prefix"]
        },
        {
            "condition": "Checking cluster naming pattern",
            "attribute_path": ["cluster"],
            "values": ["projects/*/locations/*/clusters/prod-*", [["prod"], ["staging"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details