package terraform.gcp.security.gke_backup.backup_plan.deactivated
<<<<<<< HEAD

=======
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
<<<<<<< HEAD
            "situation_description": "Backup plan must not be deactivated",
            "remedies": ["Set deactivated to false or remove the attribute"]
        },
        {
            "condition": "Checking deactivated status",
=======
            "situation_description": "Backup plan is deactivated",
            "remedies": ["Ensure backup plans are active (deactivated = false) for data protection"]
        },
        {
            "condition": "Check if backup plan is deactivated",
>>>>>>> c8b7c197646289816dec64ed2226f49abcf62e72
            "attribute_path": ["deactivated"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details