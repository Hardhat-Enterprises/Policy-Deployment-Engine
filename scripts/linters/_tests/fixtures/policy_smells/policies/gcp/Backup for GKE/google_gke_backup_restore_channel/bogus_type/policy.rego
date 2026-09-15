package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.bogus_type

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# unknown-policy-type: "pattern_whitelist" is the underscored spelling of a real
# type, which is the mistake seen in the wild. Everything else here is clean, so
# this file must produce exactly one finding.
conditions := [
    [
        {
            "situation_description": "Restore channels must follow the naming standard.",
            "remedies": ["Rename the channel to match the standard."]
        },
        {
            "condition": "Name must match the standard.",
            "attribute_path": ["bogus_type"],
            "values": ["approved-*", [["approved-"]]],
            "policy_type": "pattern_whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
