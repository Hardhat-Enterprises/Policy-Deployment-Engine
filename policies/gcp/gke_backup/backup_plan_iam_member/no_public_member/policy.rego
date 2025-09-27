package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan_iam_member.no_public_member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan_iam_member.vars

conditions := [
    [
        {
            "situation_description": "IAM member grant uses a public or overly-broad principal",
            "remedies": ["Remove public principals like allUsers and allAuthenticatedUsers", "Use specific service accounts or groups from your organization"]
        },
        {
            "condition": "c1: member must not be public",
            "attribute_path": ["member"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details