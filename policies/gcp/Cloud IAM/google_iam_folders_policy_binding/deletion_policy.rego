package terraform.gcp.security.cloud_iam.google_iam_folders_policy_binding.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_folders_policy_binding.vars

conditions := [
    [
        {
            "situation_description": "The folder IAM policy binding can be deleted by Terraform, increasing the risk of accidentally removing an access-control restriction from its target principal set.",
            "remedies": [
                "Set 'deletion_policy' to 'PREVENT' to block accidental deletion."
            ]
        },
        {
            "condition": "Check whether deletion of the folder policy binding is prevented",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
