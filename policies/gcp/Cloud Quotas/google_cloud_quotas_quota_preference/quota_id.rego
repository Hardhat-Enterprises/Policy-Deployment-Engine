package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.quota_id

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is using a non-approved quota ID",
            "remedies": [
                "Use an approved quota ID only",
                "Update the Terraform configuration so the quota_id matches the approved value"
            ]
        },
        {
            "condition": "Allow quota preferences only for approved quota IDs",
            "attribute_path": ["quota_id"],
            "values": [
                "CPUS-per-project-region"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details