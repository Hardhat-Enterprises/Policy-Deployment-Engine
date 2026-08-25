package terraform.gcp.security.apigee.google_apigee_security_action.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_security_action.vars

conditions := [
    [
        {
            "situation_description": "The Apigee security action is not protected against deletion, which could remove traffic protection applied to the environment.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Review and approve any intentional deletion of the security action.",
                "Confirm that equivalent protection exists before removing the security action."
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

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
