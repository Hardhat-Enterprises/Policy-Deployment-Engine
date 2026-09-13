package terraform.gcp.security.cloud_iam.google_iam_folders_policy_binding.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_folders_policy_binding.vars

conditions := [
    [
        {
            "situation_description": "The live folder policy binding can be deleted by Terraform, which can remove an actively enforced access-control restriction from the Google Cloud environment.",
            "remedies": ["Set deletion_policy to PREVENT to reduce the risk of accidentally deleting the live folder policy binding and removing its enforced access-control restriction."]
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
