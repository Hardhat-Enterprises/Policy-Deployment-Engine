package terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.resource_limit

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.vars

conditions := [
    [
        {
            "situation_description": "Principal Access Boundary must not include too many resources per rule",
            "remedies": [
                "Limit resources per rule to reduce attack surface",
                "Split large policies into smaller scoped boundaries",
                "Ensure least privilege access by minimizing resource scope"
            ]
        },
        {
            "condition": "Restrict maximum number of resources in access boundary rule",
            "attribute_path": ["details", 0, "rules", 0, "resources"],
            "values": [0, 5],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details