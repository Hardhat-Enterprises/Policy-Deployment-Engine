package terraform.gcp.security.apigee.google_apigee_flowhook.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_flowhook.vars

conditions := [
    [
        {
            "situation_description": "The Apigee flow hook is not protected against deletion, which could remove shared security controls applied to API traffic.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Review and approve any intentional deletion of the flow hook.",
                "Confirm that equivalent security controls exist before removing a flow hook."
            ]
        },
        {
            "condition": "Check whether deletion_policy is set to PREVENT.",
            "attribute_path": [
                "deletion_policy"
            ],
            "values": [
                "PREVENT"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Evaluates the conditions once and stores the result
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
