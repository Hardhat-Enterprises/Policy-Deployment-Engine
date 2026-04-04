package terraform.gcp.security.cloud_billing.billing_account_iam_member.billing_account_id # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.billing_account_iam_member.vars

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
  

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details