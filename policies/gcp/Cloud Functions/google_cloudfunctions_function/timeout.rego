package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.timeout
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Cloud Function timeout must not exceed 540 seconds or less than 60",
    "remedies":[ "Reduce the timeout to 540 seconds or less"]
    },
    {
        "condition": "Test whether the function timeout exceeds 540 seconds",
        "attribute_path" : ["timeout"],
        "values" : [60,540],
        "policy_type" : "range"
    }
    ]
]



result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details