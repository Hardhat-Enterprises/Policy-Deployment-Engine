package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.template_encryption_key
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
    {"situation_description" : "The job is using an encryption key that is not from the approved KMS key rings or locations. This could lead to security issues.",
    "remedies":[ "Use a CMEK from an approved key ring and location."]},
    {
        "condition": "Ensure the encryption key is from an approved KMS key ring and location",
        "attribute_path" : ["template",0,"encryption_key"], 
        "values" : ["projects/*/locations/*/keyRings/*/cryptoKeys/*", [["my-project"],["australia-southeast1","australia-southeast2"],["my-keyring"],["my-key"]]], 
        "policy_type" : "pattern whitelist" 
    }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
