package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.automatic_update_policy 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Check if automatic update policy block is there, if it is it means it's enabled",
    "remedies":[ "enable automatic update policy"]},
    {
        "condition": "Test whether automatic update policy is enabled",
        "attribute_path" : ["automatic_update_policy" ],
        "values" : [{}],
        "policy_type" : "whitelist" 
    }
    ]
]



result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details