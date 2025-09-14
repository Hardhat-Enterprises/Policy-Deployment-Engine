package terraform.gcp.security.gke_backup.backup_plan.include_volume_data
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "Backup plan must include volume data",
            "remedies": ["Set include_volume_data to true"]
        },
        {
            "condition": "Checking include_volume_data setting",
            "attribute_path": ["backup_config", 0, "include_volume_data"],
            "values": [true],
            "policy_type": "whitelist"
=======
            "situation_description": "Backup plan excludes persistent volume data",
            "remedies": ["Enable include_volume_data to backup stateful application data"]
        },
        {
            "condition": "Check if volume data is included",
            "attribute_path": ["backup_config", "include_volume_data"],  # No index needed
            "values": [false],
            "policy_type": "blacklist"
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details