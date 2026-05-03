package terraform.gcp.security.cloud_iam.google_iam_folders_policy_binding.policy_kind_validation

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_folders_policy_binding.vars

conditions := [
    [
        {
            "situation_description": "Folders Policy Binding must use an approved policy kind.",
            "remedies": [
                "Set policy_kind to PRINCIPAL_ACCESS_BOUNDARY"
            ]
        },
        {
            "condition": "Validate policy_kind",
            "attribute_path": ["policy_kind"],
            "values": ["PRINCIPAL_ACCESS_BOUNDARY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details