package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.no_project_wide_bindings

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding includes project-wide default service accounts or principals",
            "remedies": ["Avoid using project-wide default service accounts", "Create specific service accounts for backup operations"]
        },
        {
            "condition": "c1: members should not include project default accounts",
            "attribute_path": ["members"],
            "values": [
                "projectOwner:", 
                "projectEditor:", 
                "projectViewer:",
                "-compute@developer.gserviceaccount.com"
            ],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details