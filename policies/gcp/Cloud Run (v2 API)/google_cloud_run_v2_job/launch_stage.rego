package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.launch_stage
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.vars

conditions := [
    [
    {"situation_description" : "Launch stage is set to a non-production or preview value (ALPHA/BETA), which may introduce unstable features into the Cloud Run Job deployment.",
    "remedies":[ "Set launch_stage to GA for production deployments"]},
    {
        "condition": "Ensure only stable launch stages are used for Cloud Run Jobs",
        "attribute_path" : ["launch_stage"], 
        "values" : ["GA"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
