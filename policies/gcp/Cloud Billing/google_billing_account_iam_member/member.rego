package terraform.gcp.security.cloud_billing.google_billing_account_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_account_iam_member.vars

conditions := [
    [
    {"situation_description" : "Only approved and verified IAM members should be allowed",
    "remedies":[ "Use an approved IAM member's account"]},
    {
        "condition": "Only approved and verified IAM members are allowed",
        "attribute_path" : ["member"],
        "values" : ["user:jane@organization.org"],
        "policy_type" : "whitelist" 
    }
    
    ]
]
  


result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details