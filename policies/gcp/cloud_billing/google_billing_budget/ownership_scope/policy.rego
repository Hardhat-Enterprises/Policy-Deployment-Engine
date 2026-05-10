package terraform.gcp.security.cloud_billing.google_billing_budget.ownership_scope
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_budget.vars

conditions := [
    [
    {"situation_description" : "Ownership scope must be restricted to billing account level",
    "remedies":[ "Set ownership_scope to BILLING_ACCOUNT"]},
    {
        "condition": "Invalid or risky ownership scope for billing budget",
        "attribute_path" : ["ownership_scope"],
        "values" : ["BILLING_ACCOUNT"],
        "policy_type" : "whitelist" 
    }
    ]
]



result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details