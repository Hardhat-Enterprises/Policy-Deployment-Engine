package terraform.gcp.security.cloud_functions.google_cloudfunctions_function_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function_iam_member.vars


conditions := [
    [
    {"situation_description" : "Ensure only authenticated users are able to access the cloud fucntion",
    "remedies":[ "Deny access if members role is not an authenticated user"]},
    {
        "condition": "Test member has authorized access",
        "attribute_path" : ["role"],
        "values" : ["role/*",[["allAuthenticatedUsers"]]], 
        "policy_type" : "pattern whitelist" 
    }
    ]
    
]
 

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details