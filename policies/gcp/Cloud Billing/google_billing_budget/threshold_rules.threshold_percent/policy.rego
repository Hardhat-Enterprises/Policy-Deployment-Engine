package terraform.gcp.security.cloud_billing.google_billing_budget.threshold_rules_threshold_percent
import data.terraform.helpers
import data.terraform.gcp.security.cloud_billing.google_billing_budget.vars

conditions := [
    [
    {"situation_description" : "Threshold rules must be configured to trigger alerts when spending exceeds the budget",
    "remedies":[ "Add a threshold_rules block with a threshold_percent value between 0 and 1"]},
    {
        "condition": "Budget must have at least one threshold rule with a defined threshold_percent",
        "attribute_path" : ["threshold_rules", 0, "threshold_percent"],
        "values" : [null],
        "policy_type" : "blacklist"
    },
    {
        "condition": "threshold_percent must be a value between 0 and 1",
        "attribute_path" : ["threshold_rules", 0, "threshold_percent"],
        "values" : [0, 1],
        "policy_type" : "range"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
