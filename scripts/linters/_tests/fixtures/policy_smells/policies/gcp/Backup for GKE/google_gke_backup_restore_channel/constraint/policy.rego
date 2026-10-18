package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.constraint

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "List policies must not inherit from the parent folder.",
            "remedies": ["Set list_policy.inherit_from_parent to false."]
        },
        {
            "condition": "Block inheritance from parent.",
            "attribute_path": ["list_policy", "inherit_from_parent"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
