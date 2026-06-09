package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.approved_encryption_key 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.vars

conditions := [
    [
    {"situation_description" : "The job is using an encryption key that is not from the approved KMS key rings or locations. This could lead to security issues.",
    "remedies":[ "Use a CMEK from an approved key ring and location."]},
    {
        "condition": "Ensure the encryption key is from an approved KMS key ring and location",
        "attribute_path" : ["template",0,"template",0,"encryption_key"], 
        "values" : ["projects/my-project/locations/*/keyRings/*/cryptoKeys/*", [["australia-southeast1","australia-southeast2"],["run-keys"],["job-key"]]], 
        "policy_type" : "pattern whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details