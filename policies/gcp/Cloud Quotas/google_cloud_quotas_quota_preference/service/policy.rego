package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.service
import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is using a non-approved Google Cloud service",
            "remedies": [
                "Use an approved Google Cloud service only",
                "Update the Terraform configuration so the service matches the approved value"
            ]
        },
        {
            "condition": "Allow quota preferences only for approved services",
            "attribute_path": ["service"],
            "values": [
                "compute.googleapis.com"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details