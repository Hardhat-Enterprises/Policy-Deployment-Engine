package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan_iam_member.approved_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan_iam_member.vars

conditions := [
    [
        {
            "situation_description": "IAM member has excessive permissions for backup plans",
            "remedies": ["Use least-privilege roles", "Prefer backupPlanViewer or backupPlanUser over backupPlanAdmin"]
        },
        {
            "condition": "c1: role should be from approved list",
            "attribute_path": ["role"],
            "values": [
                "roles/gkebackup.backupPlanViewer",
                "roles/gkebackup.backupPlanUser",
                "roles/viewer"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details