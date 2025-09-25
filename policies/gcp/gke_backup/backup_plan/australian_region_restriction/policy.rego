package terraform.gcp.security.gke_backup.backup_plan.australian_region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Use situations (not conditions) to match what helpers.rego expects
situations := [
    {
        "situation_description": "GKE Backup plan must be deployed in Australian regions for compliance",
        "remedies": ["Set location to australia-southeast1 or australia-southeast2"],
        "condition": "c1",
        "attribute_path": ["location"],
        "values": ["australia-southeast1", "australia-southeast2"],
        "policy_type": "whitelist"
    }
]

# These calls should work with the helpers.rego file
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details