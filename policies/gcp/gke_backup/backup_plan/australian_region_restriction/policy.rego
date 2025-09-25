package terraform.gcp.security.gke_backup.backup_plan.australian_region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

situations := [
    [
        {
            "situation_description": "GKE Backup Plan must be located in approved Australian regions for data sovereignty",
            "remedies": ["Set location to australia-southeast1 or australia-southeast2"]
        },
        {
            "condition": "Checking backup plan location",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details