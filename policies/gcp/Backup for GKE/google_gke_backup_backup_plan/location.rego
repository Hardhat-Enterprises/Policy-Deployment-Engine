package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.location
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

approved_locations := [
    "australia-southeast1", # Sydney
    "australia-southeast2"  # Melbourne (DR)
]

conditions := [
    [
        {
            "situation_description": "s1: GKE Backup Plan is in a non-approved region",
            "remedies": ["Ensure the backup plan location is set to an approved Australian region (australia-southeast1 or australia-southeast2)"]
        },
        {
            "condition": "c1: backup plan location is not in approved regions",
            "attribute_path": ["location"],
            "values": approved_locations,
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
