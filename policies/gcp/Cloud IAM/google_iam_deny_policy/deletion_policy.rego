package terraform.gcp.security.cloud_iam.google_iam_deny_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_deny_policy.vars

conditions := [
    [
        {
            "situation_description": "The IAM deny policy can be deleted by Terraform, increasing the risk of accidentally removing an access-control guardrail.",
            "remedies": [
                "Set 'deletion_policy' to 'PREVENT' to block accidental deletion."
            ]
        },
        {
            "condition": "Check whether deletion of the IAM deny policy is prevented",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
