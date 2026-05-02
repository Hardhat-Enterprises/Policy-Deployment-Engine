package terraform.gcp.security.cloud_functions.google_cloudfunctions_function_iam_member.region  
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function_iam_member.vars


conditions := [
    [
    {"situation_description" : "Ensure application is being used from the correct region",
    "remedies":[ "change region to approved regions"]},
    {
        "condition": "Test whether application is being used in the correct region",
        "attribute_path" : ["region"], 
        "values" : ["australia-southeast1", "australia-southeast2"], 
        "policy_type" : "whitelist" 
    }
    ]
]
 
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details