package terraform.gcp.security.cloud_billing.google_billing_budget.currency_code
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_budget.vars

conditions := [
    [
    {"situation_description" : "Budget currency must be set to AUD",
    "remedies":[ "Set specified_amount currency_code to AUD"]},
    {
        "condition": "Budget specified_amount currency_code must be AUD",
        "attribute_path" : ["amount", 0, "specified_amount", 0, "currency_code"],
        "values" : ["AUD"],
        "policy_type" : "whitelist"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
