package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.labels

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Restore channel must carry an 'environment' label.",
            "remedies": ["Ensure labels.environment is set and not empty."]
        },
        {
            "condition": "Label environment must not be empty.",
            "attribute_path": ["labels", "environment"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
