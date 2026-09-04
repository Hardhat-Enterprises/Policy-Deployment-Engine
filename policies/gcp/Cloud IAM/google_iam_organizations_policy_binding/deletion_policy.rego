package terraform.gcp.security.cloud_iam.google_iam_organizations_policy_binding.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_organizations_policy_binding.vars

conditions := [
    [
        {
            "situation_description": "The organization policy binding can be destroyed by Terraform, increasing the risk of accidental destructive loss of the binding and its security configuration.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental Terraform destruction of the organization policy binding."]
        },
        {
            "condition": "Check whether deletion of the organization policy binding is prevented",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
