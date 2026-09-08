package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.destination_project

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Restore channel points at an unapproved destination project.",
            "remedies": ["Set destination_project to an approved project."]
        },
        {
            "condition": "Destination project must be the approved one.",
            "attribute_path": ["destination_project"],
            "values": ["projects/PDE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
