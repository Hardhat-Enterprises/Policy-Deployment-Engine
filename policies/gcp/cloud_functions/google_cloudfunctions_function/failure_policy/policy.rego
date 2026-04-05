package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.failure_policy
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Ensures failure policy retry is set to true",
    "remedies":[ "change failure policy retry attribute to true"]},
    {
        "condition": "Test if failure policy retry is set to true. ",
        "attribute_path" : ["event_trigger", 0, "failure_policy", 0, "retry"], 
        "values" : [false], 
        "policy_type" : "blacklist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details