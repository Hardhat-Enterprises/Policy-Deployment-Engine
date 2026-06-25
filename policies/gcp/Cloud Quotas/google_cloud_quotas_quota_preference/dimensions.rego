package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.dimensions

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is using a non-approved Australian region in dimensions",
            "remedies": [
                "Use an approved Australian region only",
                "Update the Terraform configuration so the dimensions.region matches an approved Australian region"
            ]
        },
        {
            "condition": "Allow quota preferences only for approved Australian dimension regions",
            "attribute_path": ["dimensions", "region"],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details