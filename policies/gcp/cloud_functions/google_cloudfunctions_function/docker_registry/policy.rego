package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.docker_registry
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {"situation_description" : "Ensures only fully supported docker registies are supported",
    "remedies":[ "Change docker registry to a version which hase not been decomissioned or depreciated "]},
    {
        "condition": "Test if docker registry is not decomissioned or depreciated. ",
        "attribute_path" : ["docker_registry"], 
        "values" : ["ARTIFACT_REGISTRY"], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details