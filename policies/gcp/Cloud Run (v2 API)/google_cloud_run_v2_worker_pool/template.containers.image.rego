package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.allowed_image 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
    {
        "situation_description": "Public container registries are not allowed due to security risks and lack of governance.",
        "remedies": ["Move images to Artifact Registry under approved GCP project"]
    },
    {
        "condition": "Block public container registries like Docker Hub and GCR",
        "attribute_path": ["template",0,"containers",0,"image"],
        "values": [ "*", [["gcr.io", "docker.io", "index.docker.io", "quay.io"]]],
        "policy_type": "pattern blacklist"
    }
    ]

]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
