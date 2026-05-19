package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.nfs_read_only 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
    {"situation_description" : "Cloud Run Worker pool is allowing writable access",
    "remedies":[ "Set read_only = true"]},
    {
        "condition": "NFS volume is writable",
        "attribute_path" : ["template",0,"volumes", 0, "nfs",0,"read_only"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details