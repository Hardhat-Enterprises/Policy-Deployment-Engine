package terraform.gcp.security.apigee.google_apigee_target_server.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server is not protected against deletion, which could interrupt API connectivity to the backend service.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Review and approve any intentional deletion of the target server."
            ]
        },
        {
            "condition": "Check whether deletion_policy is set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

# Evaluates the conditions once and stores the summary
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
