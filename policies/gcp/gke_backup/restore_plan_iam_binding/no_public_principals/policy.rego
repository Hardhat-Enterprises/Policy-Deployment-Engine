package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.no_public_principals

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding grants access to public or overly-broad principals",
            "remedies": ["Remove public principals like allUsers and allAuthenticatedUsers", "Use specific service accounts or groups from your organization"]
        },
        {
            "condition": "c1: members[0] must not be public",
            "attribute_path": ["members", 0],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        },
        {
            "condition": "c2: members[1] must not be public",
            "attribute_path": ["members", 1],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        },
        {
            "condition": "c3: members[2] must not be public",
            "attribute_path": ["members", 2],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details