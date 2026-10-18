package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.sibling_gated

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# Clean: a rule made conditional on a sibling argument, which is what
# "match": "all" is for. Two things are pinned here — the metadata entry may
# carry "match" without being mistaken for a condition, and a condition reading
# a SIBLING argument does not trip wrong-argument as long as one condition still
# reads the argument the file is named after. This file must be silent.
conditions := [
    [
        {
            "situation_description": "Channel is neither peered nor privately connected.",
            "remedies": ["Set sibling_gated, or enable the private endpoint."],
            "match": "all"
        },
        {
            "condition": "The peering network is not a full VPC path.",
            "attribute_path": ["sibling_gated"],
            "values": ["projects/*/global/networks/*"],
            "policy_type": "element pattern whitelist"
        },
        {
            "condition": "The private endpoint is not enabled.",
            "attribute_path": ["private_endpoint_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
