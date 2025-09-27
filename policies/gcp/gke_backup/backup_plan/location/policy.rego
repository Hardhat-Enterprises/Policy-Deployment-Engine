package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan location not in approved regions",
            "remedies": ["Use approved regions for backup plans", "Consider data residency requirements"]
        },
        {
            "condition": "c1: location must be in approved regions",
            "attribute_path": ["location"],
            "values": ["us-central1", "us-east1", "europe-west1", "europe-west2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details