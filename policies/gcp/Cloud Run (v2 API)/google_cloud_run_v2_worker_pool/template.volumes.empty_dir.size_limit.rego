package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.template_volumes_empty_dir_size_limit
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool.vars

conditions := [
    [
        {
            "situation_description": "EmptyDir size limit must be within approved limits",
            "remedies": ["Set size_limit to an approved value, i.e, under 512Mi"]
        },
        {
            "condition": "EmptyDir size_limit exceeds allowed threshold",
            "attribute_path": ["template",0,"volumes", 0, "empty_dir",0, "size_limit"],
            "values": ["128Mi", "256Mi", "512Mi"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
