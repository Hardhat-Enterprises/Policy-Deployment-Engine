package terraform.gcp.security.deploy.google_clouddeploy_deploy_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_deploy_policy.vars

conditions := [
    [
        {
            "situation_description": "Deploy policy deletion policy must prevent Terraform from destroying the policy resource.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Using PREVENT protects the deploy policy from accidental Terraform destruction."
            ]
        },
        {
            "condition": "deletion_policy is in approved whitelist",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
