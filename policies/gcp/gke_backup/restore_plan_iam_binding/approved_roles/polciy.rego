package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.approved_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding uses excessive permissions for restore plans",
            "remedies": ["Use least-privilege roles", "Prefer restorePlanViewer over restorePlanAdmin unless admin access is required"]
        },
        {
            "condition": "c1: role should be from approved list",
            "attribute_path": ["role"],
            "values": [
                "roles/gkebackup.restorePlanViewer",
                "roles/gkebackup.restorePlanUser",
                "roles/viewer"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details