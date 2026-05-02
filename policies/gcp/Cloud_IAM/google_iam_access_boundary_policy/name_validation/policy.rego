package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [

    [
        {
            "situation_description": "Policy name is missing or not properly defined",
            "remedies": [
                "Provide a valid policy name",
                "Use meaningful naming (e.g., pde-access-boundary)"
            ]
        },
        {
            "condition": "Validate policy name format",
            "attribute_path": ["address"],
            "values": ["pde-*"],
            "policy_type": "pattern whitelist"
        }
    ]
]


result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details