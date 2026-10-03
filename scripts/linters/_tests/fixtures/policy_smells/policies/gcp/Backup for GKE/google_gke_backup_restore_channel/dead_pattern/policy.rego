package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.dead_pattern

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# pattern-values-shape: a single regex where the engine expects
# [target, [[allowed per *], ...]]. This is the mistake seen in the wild — the
# condition reads as a shape check but `values_formatted[1]` is undefined, so it
# flags nothing at all. Everything else here is clean, so this file must produce
# exactly one finding.
conditions := [
    [
        {
            "situation_description": "Restore channel must name a full KMS key path.",
            "remedies": ["Set the key to a full projects/.../cryptoKeys/... path."]
        },
        {
            "condition": "Key must be a fully qualified KMS path.",
            "attribute_path": ["dead_pattern"],
            "values": ["^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
