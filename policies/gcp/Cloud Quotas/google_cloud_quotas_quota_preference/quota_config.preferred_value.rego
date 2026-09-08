package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.quota_config_preferred_value

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is requesting a preferred quota value outside the approved range",
            "remedies": [
                "Set the preferred quota value within the approved range",
                "Reduce the requested preferred value to meet policy requirements"
            ]
        },
        {
            "condition": "Allow quota preferred values only within the approved range",
            "attribute_path": ["quota_config", 0, "preferred_value"],
            "values": [0, 500],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details