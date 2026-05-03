package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.name_validation
import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [
    [
    {"situation_description" : "PDE Access Boundary Policy must use only approved secure policy names.",
    "remedies":[ "Use only approved PDE policy names such as pde-ab-policy, secure-ab-policy, or prod-ab-policy"]},
    {
        "condition": "Whitelist validation for AB policy name",
        "attribute_path" : ["name"],
        "values": ["pde-ab-policy",
                "secure-ab-policy",
                "prod-ab-policy"],
        "policy_type" : "whitelist" 
    }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details