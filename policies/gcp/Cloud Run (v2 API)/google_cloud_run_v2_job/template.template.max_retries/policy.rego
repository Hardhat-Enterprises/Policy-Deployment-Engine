package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.max_retries 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.vars

conditions := [
    [
    {"situation_description" : "Excessive retries could overwhelm system resources, causing DoS-like behavior",
    "remedies":[ "Limit the max_retries to a reasonable number"]},
    {
        "condition": "Check that max_retries does not exceed your chosen threshold",
        "attribute_path" : ["template",0,"template",0,"max_retries"],
        "values" : [1,5], 
        "policy_type" : "range" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
