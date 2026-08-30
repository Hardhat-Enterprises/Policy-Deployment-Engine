package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.legacy

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Legacy argument is set to an unapproved value.",
            "remedies": ["Set legacy to 'approved'."]
        },
        {
            "condition": "Legacy must be approved.",
            "attribute_path": ["legacy"],
            "values": ["approved"],
            "policy_type": "whitelist"
        }
    ]
]

result = helpers.get_multi_summary(conditions, vars.variables)

message = result.message
details = result.details
