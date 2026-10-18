package terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.vars

conditions := [
    [
        {
            "situation_description": "The workforce pool provider can be deleted by Terraform, increasing the risk of accidental removal of identity federation infrastructure.",
            "remedies": [
                "Set 'deletion_policy' to 'PREVENT' to block accidental deletion."
            ]
        },
        {
            "condition": "Check whether deletion of the provider is prevented",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
