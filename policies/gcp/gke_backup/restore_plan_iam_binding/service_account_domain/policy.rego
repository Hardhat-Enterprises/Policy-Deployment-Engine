package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.service_account_domain

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "Service accounts from external projects granted access",
            "remedies": ["Use service accounts from approved projects only", "Verify service account domain matches your organization's projects"]
        },
        {
            "condition": "c1: service account patterns must match approved projects",
            "attribute_path": ["members"],
            "values": [
                "serviceAccount:*@*.iam.gserviceaccount.com",
                [[], ["test-project", "prod-project", "dev-project"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details