package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.short

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Bad value.",
            "remedies": ["Set short to 'approved'."]
        },
        {
            "condition": "Short must be approved.",
            "attribute_path": ["short"],
            "values": ["approved"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
