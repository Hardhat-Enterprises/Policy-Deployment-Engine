package terraform.gcp.security.BackupForGKE.google_gke_backup_restore_channel.badcase

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Badcase argument is set to an unapproved value.",
            "remedies": ["Set badcase to 'approved'."]
        },
        {
            "condition": "Badcase must be approved.",
            "attribute_path": ["badcase"],
            "values": ["approved"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
