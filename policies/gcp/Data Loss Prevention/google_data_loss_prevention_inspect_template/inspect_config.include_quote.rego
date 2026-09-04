package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_inspect_template.inspect_config_include_quote
import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_inspect_template.vars

conditions := [
    [
    {"situation_description" : "The inspect template returns quoted samples of detected sensitive data in scan findings",
    "remedies":[ "Set include_quote to false so findings do not contain the sensitive values themselves"]},
    {
        "condition": "Check if include_quote is disabled",
        "attribute_path" : ["inspect_config", 0, "include_quote"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details