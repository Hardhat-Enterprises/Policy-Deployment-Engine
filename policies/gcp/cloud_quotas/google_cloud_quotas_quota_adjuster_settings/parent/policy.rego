package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_adjuster_settings.parent

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_adjuster_settings.vars

conditions := [
    [
        {
            "situation_description": "Quota adjuster settings are being created outside the approved project scope",
            "remedies": [
                "Set the parent to an approved project only",
                "Update the Terraform configuration so the parent matches the approved project path"
            ]
        },
        {
            "condition": "Allow quota adjuster settings only in approved projects",
            "attribute_path": ["parent"],
            "values": [
                "projects/*",
                [["104740170505"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details