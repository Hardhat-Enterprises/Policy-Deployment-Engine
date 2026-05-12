package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_cloud_config_read_authorizer_credential_user_token_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Ensure Bitbucket Cloud read authorizer credential user token secret version uses the required Secret Manager format",
            "remedies": ["Use user_token_secret_version in the format projects/*/secrets/*/versions/*"]
        },
        {
            "condition": "user_token_secret_version must use approved Secret Manager path format",
            "attribute_path": ["bitbucket_cloud_config", 0, "read_authorizer_credential", 0, "user_token_secret_version"],
            "values": [
                "projects/*/secrets/*/versions/*",
                [
                    ["my-project-c"],  
                    ["read-token"],    
                    ["1"]              
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details