package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.two_conditions

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# situation-match-unset: two conditions in one situation and no "match" key, so
# the union default is taken silently. Everything else here is clean, so this
# file must produce exactly one finding.
conditions := [
    [
        {
            "situation_description": "Restore channel is not configured for production.",
            "remedies": ["Set the tier and the mode to their production values."]
        },
        {
            "condition": "Tier must be production.",
            "attribute_path": ["two_conditions"],
            "values": ["PRODUCTION"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Mode must be strict.",
            "attribute_path": ["two_conditions_mode"],
            "values": ["STRICT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
