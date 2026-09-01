package terraform.gcp.security.apigee.google_apigee_sharedflow_deployment.service_account
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_sharedflow_deployment.vars
conditions := [
    [
        {
            "situation_description": "service_account must be explicitly set to enforce least-privilege identity",
            "remedies": [
                "Set service_account to a dedicated service account in the format {ACCOUNT_ID}@{PROJECT}.iam.gserviceaccount.com"
            ]
        },
        {
            "condition": "check service_account is set",
            "attribute_path": ["service_account"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
