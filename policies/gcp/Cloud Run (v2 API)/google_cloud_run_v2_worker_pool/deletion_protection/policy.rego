package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
    {"situation_description" : "Deletion protection is disabled, meaning the job can be accidentally removed during Terraform destroy or apply operations.",
    "remedies":[ "Enable deletion protection by setting the value to true"]},
    {
        "condition": "Ensure deletion protection is enabled to prevent accidental resource destruction",
        "attribute_path" : ["deletion_protection"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details