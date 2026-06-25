package terraform.gcp.security.cloud_billing.google_billing_budget.amount_specified_amount_units
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_budget.vars

conditions := [
    [
    {"situation_description" : "Budget amount must be set and within an acceptable spending range",
    "remedies":[ "Set specified_amount units to a value between 1 and 1000000"]},
    {
        "condition": "Budget specified_amount units cannot be null",
        "attribute_path" : ["amount", 0, "specified_amount", 0, "units"],
        "values" : [null, ""],
        "policy_type" : "blacklist"
    },
    {
        "condition": "Budget specified_amount units must be within the approved range",
        "attribute_path" : ["amount", 0, "specified_amount", 0, "units"],
        "values" : [1, 1000000],
        "policy_type" : "range"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
