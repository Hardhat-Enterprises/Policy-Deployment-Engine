package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.external_user_domains

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "IAM binding includes users from external domains",
            "remedies": ["Restrict access to users from your organization's domain", "Use groups for better access management"]
        },
        {
            "condition": "c1: user email domains must be from approved list",
            "attribute_path": ["members"],
            "values": [
                "user:*@*",
                [[], ["example.com", "company.com", "yourorg.com"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details