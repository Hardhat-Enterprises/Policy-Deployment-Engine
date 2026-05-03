package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client_credential.client_type_validation
import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client_credential.vars

conditions := [
    [
    {"situation_description" : "OAuth client credentials must use approved client types only.",
    "remedies":[ "Use only CONFIDENTIAL_CLIENT or PUBLIC_CLIENT OAuth configurations"]},
    {
        "condition": "Whitelist OAuth client type",
        "attribute_path" : ["client_type"], 
        "values" : ["CONFIDENTIAL_CLIENT","PUBLIC_CLIENT"],
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details