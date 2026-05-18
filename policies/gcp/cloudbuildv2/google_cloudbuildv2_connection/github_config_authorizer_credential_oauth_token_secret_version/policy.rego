package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_config_authorizer_credential_oauth_token_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Ensure GitHub OAuth token secret version uses the required Secret Manager format",
            "remedies": ["Use oauth_token_secret_version in the format projects/*/secrets/*/versions/*"]
        },
        {
            "condition": "oauth_token_secret_version must use approved Secret Manager path format",
            "attribute_path": ["github_config", 0, "authorizer_credential", 0, "oauth_token_secret_version"],
            "values": [
                "projects/*/secrets/*/versions/*",
                [
                    ["my-project-c", "my-project-nc"],  
                    ["oauth-token"],                     
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