package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.runtime
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Ensures only fully supported runtimes are used",
    "remedies":[ "Change runtime to a version which hase not been decomissioned or depreciated "]},
    {
        "condition": "Test if runtime is not decomissioned or depreciated. ",
        "attribute_path" : ["runtime"], 
        "values" : ["Nodejs20", "Nodejs22", "Python3.10", "python3.11", "Python3.12", "Go1.21", "Go1.22", "Java17", "Java21", "Ruby3.2", "Ruby3.3", "PHP8.2", "PHP8.3" ], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details