package terraform.gcp.security.gke_backup.backup_plan.labels
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan missing required labels",
            "remedies": ["Add labels for environment, team, and cost-center for proper resource management"]
        },
        {
            "condition": "Check for required label: environment",
            "attribute_path": ["labels", "environment"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details