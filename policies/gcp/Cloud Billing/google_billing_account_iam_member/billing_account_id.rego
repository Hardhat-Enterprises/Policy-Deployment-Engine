package terraform.gcp.security.cloud_billing.google_billing_account_iam_member.billing_account_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_account_iam_member.vars

conditions := [
    [
    {"situation_description" : "Billing account ID cannot be empty",
    "remedies":[ "Set a valid billing account ID"]},
    {
        "condition": "Billing account ID is required",
        "attribute_path" : ["billing_account_id"], 
        "values" : [null, ""],
        "policy_type" : "blacklist" 
    }
    ]
]
  


result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details