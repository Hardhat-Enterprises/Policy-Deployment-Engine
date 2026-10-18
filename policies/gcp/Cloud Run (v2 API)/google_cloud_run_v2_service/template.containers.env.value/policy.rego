package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.template_containers_env_value
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Literal environment variable values risk exposing plaintext secrets such as API keys or passwords in Terraform state and configuration.",
            "remedies": ["Use Secret Manager references via value_source.secret_key_ref instead of plaintext env values."]
        },
        {
            "condition": "Plaintext env values must not be set",
            "attribute_path": ["template",0,"containers",0,"env","value"],
            "values": [null,""],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details