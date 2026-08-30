package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
    [
        {
            "situation_description": "Restore channel must live in an approved location.",
            "remedies": ["Set location to australia-southeast1."]
        },
        {
            "condition": "Location must be australia-southeast1.",
            "attribute_path": ["location"],
            "values": ["projects/pde-prod/locations/australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
