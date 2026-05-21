package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.encryption_key_revocation_action 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
    {"situation_description" : "Worker Pool must shut down instances if encryption key is revoked",
    "remedies":[ "Set encryption_key_revocation_action to SHUTDOWN"]},
    {
        "condition": "Revocation action is not set to SHUTDOWN",
        "attribute_path" : ["template",0,"encryption_key_revocation_action"], 
        "values" : ["SHUTDOWN"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details