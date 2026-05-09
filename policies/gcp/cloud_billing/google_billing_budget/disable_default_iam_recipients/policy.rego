package terraform.gcp.security.cloud_billing.google_billing_budget.disable_default_iam_recipients
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_budget.vars

conditions := [
    [
    {"situation_description" : "Default IAM recipients must not be disabled so billing admins always receive budget alerts",
    "remedies":[ "Set disable_default_iam_recipients to false in the all_updates_rule block"]},
    {
        "condition": "disable_default_iam_recipients must not be set to true",
        "attribute_path" : ["all_updates_rule", 0, "disable_default_iam_recipients"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
