package terraform.gcp.security.lustre.google_lustre_instance.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance deletion policy does not prevent destructive deletion.",
            "remedies": [
                "Set 'deletion_policy' = \"PREVENT\" to protect the Lustre instance from Terraform destruction."
            ]
        },
        {
            "condition": "'deletion_policy' is not set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details