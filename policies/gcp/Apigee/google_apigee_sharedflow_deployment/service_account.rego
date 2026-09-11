package terraform.gcp.security.apigee.google_apigee_sharedflow_deployment.service_account
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_sharedflow_deployment.vars
conditions := [
    [
        {
            "situation_description": "Sharedflow deployment does not specify a dedicated service account in the required GCP format, allowing it to operate without a properly scoped identity.",
            "remedies": [
                "Set service_account to a dedicated service account in the format {ACCOUNT_ID}@{PROJECT}.iam.gserviceaccount.com"
            ]
        },
        {
            "condition": "Check service_account is not null or empty",
            "attribute_path": ["service_account"],
            "values": [null, ""],
            "policy_type": "blacklist"
        },
        {
            "condition": "Check service_account follows GCP service account format",
            "attribute_path": ["service_account"],
            "values": [
                "*@*.iam.gserviceaccount.com",
                [
                    ["apigee-sa"],
                    ["example-project"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
