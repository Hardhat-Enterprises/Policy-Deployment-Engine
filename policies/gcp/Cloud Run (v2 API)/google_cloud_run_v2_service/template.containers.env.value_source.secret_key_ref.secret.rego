package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.template_containers_env_value_source_secret_key_ref_secret
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Environment variable is not using Secret Manager reference.",
            "remedies": ["Use secret from secret_key_ref with value_source"]
        },
        {
            "condition": "Require secret from secret_key_ref in value_source for env variables",
            "attribute_path": ["template",0,"containers",0,"env",0,"value_source",0,"secret_key_ref",0,"secret"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Secret reference does not follow Secret Manager naming convention.",
            "remedies": ["Use a fully qualified Secret Manager secret path (e.g. projects/my-project/secrets/my-secret)"]
        },
        {
            "condition": "Require valid Secret Manager secret path",
            "attribute_path": ["template",0,"containers",0,"env",0,"value_source",0,"secret_key_ref",0,"secret"],
            "values": ["^projects/.+/secrets/.+"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details