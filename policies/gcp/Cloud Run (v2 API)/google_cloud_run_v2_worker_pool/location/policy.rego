package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.allowed_location 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
    {"situation_description" : "Parameters should be in the Australian location",
    "remedies":[ "Change it to Australia location"]},
    {
        "condition": "Region is not in Australia",
        "attribute_path" : ["location"], 
        "values" : ["australia-southeast1","australia-southeast2"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
