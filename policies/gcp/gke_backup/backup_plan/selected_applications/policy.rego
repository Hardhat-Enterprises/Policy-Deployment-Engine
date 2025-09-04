package terraform.gcp.security.gke_backup.backup_plan.selected_applications
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan includes all namespaces without filtering",
            "remedies": ["Use selected_applications or selected_namespaces to backup only production workloads"]
        },
        {
            "condition": "Check for selective backup",
            "attribute_path": ["backup_config", "all_namespaces"],  # No index needed
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details