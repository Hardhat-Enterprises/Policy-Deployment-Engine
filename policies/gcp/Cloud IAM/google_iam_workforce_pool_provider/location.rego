package terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.vars

conditions := [
    [
        {
            "situation_description": "The workforce pool provider is created outside the approved location whitelist.",
            "remedies": [
                "Set 'location' to an approved value such as 'global'."
            ]
        },
        {
            "condition": "Check whether the provider uses an approved location",
            "attribute_path": ["location"],
            "values": ["global"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
