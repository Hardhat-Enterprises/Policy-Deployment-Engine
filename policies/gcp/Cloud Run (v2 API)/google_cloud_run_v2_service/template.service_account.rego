package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.template_service_account
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Default service account is being used which may have excessive permissions.",
            "remedies": ["Use a dedicated least-privileged service account"]
        },
        {
            "condition": "Block default service accounts",
            "attribute_path": ["template",0,"service_account"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Service account does not match IAM service account format.",
            "remedies": ["Specify a valid IAM service account email (e.g. my-sa@my-project.iam.gserviceaccount.com)"]
        },
        {
            "condition": "Require valid IAM service account format",
            "attribute_path": ["template",0,"service_account"],
            "values": [".+@.+\\.iam\\.gserviceaccount\\.com"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details