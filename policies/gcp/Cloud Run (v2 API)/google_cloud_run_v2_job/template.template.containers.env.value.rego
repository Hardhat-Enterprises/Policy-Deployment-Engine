package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.template_template_containers_env_value
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job.vars

conditions := [
    [
    {
        "situation_description": "Plaintext environment variable value may expose sensitive data.",
        "remedies": ["Use value_source with Secret Manager instead of value"]
    },
    {
        "condition": "Disallow plaintext env values",
        "attribute_path": ["template",0,"template",0,"containers",0,"env",0,"value"],
        "values": [""],
        "policy_type": "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
