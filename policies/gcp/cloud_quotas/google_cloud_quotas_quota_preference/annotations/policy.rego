package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.annotations

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is using a non-approved annotation owner value",
            "remedies": [
                "Use an approved owner annotation only",
                "Update the Terraform configuration so annotations.owner matches the approved value"
            ]
        },
        {
            "condition": "Allow quota preferences only for approved annotation owner values",
            "attribute_path": ["annotations", "owner"],
            "values": [
                "cloud-team"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details