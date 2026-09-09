package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.parent

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is being created outside the approved project scope",
            "remedies": [
                "Set the parent to an approved project only",
                "Update the Terraform configuration so the parent matches the approved project path"
            ]
        },
        {
            "condition": "Allow quota preferences only in approved projects",
            "attribute_path": ["parent"],
            "values": [
                "projects/*",
                [["my-project-name"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details