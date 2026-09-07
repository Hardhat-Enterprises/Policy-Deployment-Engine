package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.ignore_safety_checks

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is bypassing quota safety checks",
            "remedies": [
                "Do not ignore quota safety checks",
                "Remove unsafe ignore_safety_checks values from the Terraform configuration"
            ]
        },
        {
             "condition": "Disallow unsafe quota safety check bypass values",
             "attribute_path": ["ignore_safety_checks"],
             "values": [
             "QUOTA_DECREASE_BELOW_USAGE",
             "QUOTA_DECREASE_PERCENTAGE_TOO_HIGH"
    ],
    "policy_type": "blacklist"
}
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details