package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.justification

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is using a non-approved justification",
            "remedies": [
                "Use an approved justification only",
                "Update the Terraform configuration so the justification matches an approved value"
            ]
        },
        {
            "condition": "Allow quota preferences only for approved justifications",
            "attribute_path": ["justification"],
            "values": [
                "Required for approved academic workload"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details