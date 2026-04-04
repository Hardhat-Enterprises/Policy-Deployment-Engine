package terraform.gcp.security.cloud_billing.billing_account_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.billing_account_iam_member.vars

conditions := [
    [
    {"situation_description" : "IAM member cannot be empty",
    "remedies":[ "Set a valid IAM member (e.g., user:email or serviceAccount)"]},
    {
        "condition": "IAM member is required",
        "attribute_path" : ["member"], 
        "values" : [null, ""],
        "policy_type" : "blacklist" 
    }
    ]
]
  


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details