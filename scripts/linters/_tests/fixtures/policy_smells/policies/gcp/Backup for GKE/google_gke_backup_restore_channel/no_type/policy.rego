package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.no_type

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# unknown-policy-type: the condition simply has no policy_type. helpers.rego
# skips such an entry (that is how it tells a check apart from the
# situation_description/remedies metadata), so the check never runs.
conditions := [
    [
        {
            "situation_description": "Restore channels must declare an owner.",
            "remedies": ["Add an owner label to the channel."]
        },
        {
            "condition": "An owner must be recorded.",
            "attribute_path": ["no_type"],
            "values": ["team-platform"]
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
