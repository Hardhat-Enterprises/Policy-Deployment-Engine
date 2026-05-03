package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.rules_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [
    [
        {
            "situation_description": "Access Boundary Policy must contain a safe number of rules (1 to 3) to reduce misconfiguration risk.",
            "remedies": [
                "Ensure rules block count is between 1 and 3"
            ]
        },
        {
            "condition": "Validate rules count range",
            "attribute_path": ["rules"],
            "values": [1, 3],
            "policy_type": "range"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details