package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.max_instances
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Check if max instances is over 100",
    "remedies":[ "The max instances coexisting must not exceed 100"]},
    {
        "condition": "Test if max instances coexisting does not exceed 100",
        "attribute_path" : ["max_instances"],
        "values" : [null,100],
        "policy_type" : "range"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details