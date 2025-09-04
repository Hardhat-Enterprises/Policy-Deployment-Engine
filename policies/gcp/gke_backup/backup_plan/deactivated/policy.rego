package terraform.gcp.security.gke_backup.backup_plan.deactivated
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan is deactivated",
            "remedies": ["Ensure backup plans are active (deactivated = false) for data protection"]
        },
        {
            "condition": "Check if backup plan is deactivated",
            "attribute_path": ["deactivated"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details