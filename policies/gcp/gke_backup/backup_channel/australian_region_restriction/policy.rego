package terraform.gcp.security.gke_backup.backup_channel.australian_region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_channel.vars

# Policy to ensure backup channels are created in Australian regions only
situations := [
    [
        {
            "situation_description": "GKE backup channels must be created in Australian regions for compliance",
            "remedies": ["Use australia-southeast1 or australia-southeast2", "Update location to Australian region"]
        },
        {
            "condition": "non_australian_region_check",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details