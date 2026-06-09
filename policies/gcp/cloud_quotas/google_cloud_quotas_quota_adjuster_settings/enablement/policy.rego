package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_adjuster_settings.enablement

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_adjuster_settings.vars

conditions := [
    [
        {
            "situation_description": "Quota adjuster settings are using a non-approved enablement value",
            "remedies": [
                "Set enablement to DISABLED",
                "Update the Terraform configuration so the enablement value matches the approved setting"
            ]
        },
        {
            "condition": "Allow quota adjuster settings only when enablement is DISABLED",
            "attribute_path": ["enablement"],
            "values": [
                "DISABLED"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details