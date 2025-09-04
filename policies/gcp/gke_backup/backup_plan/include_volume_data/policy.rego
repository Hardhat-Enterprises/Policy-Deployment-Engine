package terraform.gcp.security.gke_backup.backup_plan.include_volume_data
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan excludes persistent volume data",
            "remedies": ["Enable include_volume_data to backup stateful application data"]
        },
        {
            "condition": "Check if volume data is included",
            "attribute_path": ["backup_config", "include_volume_data"],  # No index needed
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details