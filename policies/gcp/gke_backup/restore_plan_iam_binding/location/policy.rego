package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding for restore plan in non-approved region",
            "remedies": ["Use approved regions for restore plan IAM bindings", "Ensure compliance with data residency requirements"]
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