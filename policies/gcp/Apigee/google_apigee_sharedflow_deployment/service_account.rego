package terraform.gcp.security.apigee.google_apigee_sharedflow_deployment.service_account
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_sharedflow_deployment.vars
conditions := [
    [
        {
            "situation_description": "Sharedflow deployment does not specify a dedicated service account, allowing it to operate without a scoped identity and violating the principle of least privilege.",
            "remedies": [
                "Set service_account to a dedicated service account in the format {ACCOUNT_ID}@{PROJECT}.iam.gserviceaccount.com. The GCP API validates the format at apply time."
            ]
        },
        {
            "condition": "Check if a dedicated service account is configured",
            "attribute_path": ["service_account"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
