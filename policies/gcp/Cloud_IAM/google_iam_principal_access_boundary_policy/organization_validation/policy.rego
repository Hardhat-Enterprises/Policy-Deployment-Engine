package terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.organization_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.vars

conditions := [
    [
    {"situation_description" : "Principal Access Boundary policies must use only approved organization IDs to ensure proper IAM governance and organizational compliance.",
    "remedies":[ "Use only approved organization IDs"]},
    {
        "condition": "Validate organization field",
        "attribute_path" : ["organization"],
        "values": ["PDE1", "PDE2", "PDE3"],
        "policy_type" : "whitelist" 
    }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details