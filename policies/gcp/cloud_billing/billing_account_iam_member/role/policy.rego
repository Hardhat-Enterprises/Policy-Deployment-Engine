package terraform.gcp.security.cloud_billing.billing_account_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.billing_account_iam_member.vars

conditions := [
    [
    {"situation_description" : "Role must be a valid Cloud Billing IAM role",
    "remedies":[ "Use an approved role starting with roles/billing."]},
    {
        "condition": "Only approved Cloud Billing IAM roles are allowed",
        "attribute_path" : ["role"],
        "values": ["roles/billing.*", [["creator", "admin", "costsManager", "viewer", "projectCostsManager", "user", "projectManager"]]],
        "policy_type" : "pattern whitelist"
    }
    ]
]
  


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details