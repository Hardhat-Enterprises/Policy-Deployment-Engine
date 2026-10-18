package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.unset_blind

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# presence-missing-null: blacklisting only "" misses the unset case, which the
# plan JSON carries as null. This file deliberately also trips presence-only —
# the two rules describe the same condition from different angles and the real
# shape in the tree fires both, so the pair is pinned rather than split up.
conditions := [
    [
        {
            "situation_description": "Restore channel must declare a description.",
            "remedies": ["Set description to something that identifies the channel."]
        },
        {
            "condition": "Description must not be empty.",
            "attribute_path": ["unset_blind"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
