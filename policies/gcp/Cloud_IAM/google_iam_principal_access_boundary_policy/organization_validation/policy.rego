package terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.organization_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.vars

conditions := [
    [
        {
            "situation_description": "Organization must start with PDE and contain only letters or numbers after it.",
            "remedies": [
                "Use organization IDs like PDE123 or PDE-A1 (must start with PDE)"
            ]
        },
        {
            "condition": "Validate organization format",
            "attribute_path": ["organization"],
            "values": ["^PDE[a-zA-Z0-9-]*$"],
            "policy_type": "pattern whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details