package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.available_memory_mb 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Resource is using an unsupported specefied memory value",
    "remedies":[ "Change available memory to a supported memory value, 128, 256, 512, 1024 or 2048Mb "]},
    {
        "condition": "Test if cloud function has enough available memory in order for resource to run effectively",
        "attribute_path" : ["available_memory_mb" ],
        "values" : [128, 256, 512, 1024, 2048],
        "policy_type" : "whitelist" 
    }
    ]
]



result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details