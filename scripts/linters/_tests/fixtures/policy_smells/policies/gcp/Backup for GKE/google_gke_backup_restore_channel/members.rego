package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.members

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Access granted to the whole internet.",
            "remedies": ["Remove allUsers and allAuthenticatedUsers from members."]
        },
        {
            "condition": "Public access should be prohibited.",
            "attribute_path": ["members", 0],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
