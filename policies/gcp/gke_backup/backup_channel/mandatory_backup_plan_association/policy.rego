package terraform.gcp.security.gke_backup.backup_channel.mandatory_backup_plan_association

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_channel.vars

# Policy to ensure backup channels are properly associated with backup plans
situations := [
    [
        {
            "situation_description": "Backup channel must be associated with a valid backup plan",
            "remedies": ["Configure backup_plan reference", "Associate with existing backup plan", "Ensure proper backup plan linkage"]
        },
        {
            "condition": "backup_plan_association_check",
            "attribute_path": ["backup_plan"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details