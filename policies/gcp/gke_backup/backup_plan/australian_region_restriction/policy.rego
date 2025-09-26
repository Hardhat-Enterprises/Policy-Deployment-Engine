package terraform.gcp.security.gke_backup.backup_plan.australian_region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Policy to ensure backup plans are created in Australian regions only
situations := [
    [
        {
            "situation_description": "GKE backup plans must be created in Australian regions for compliance",
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