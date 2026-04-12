package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_config_authorizer_credential_oauth_token_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved OAuth token secret versions",
            "remedies": ["Use approved OAuth token secret version only"]
        },
        {
            "condition": "Use approved OAuth token secret version only",
            "attribute_path": ["github_config", 0, "authorizer_credential", 0, "oauth_token_secret_version"],
            "values": [
                "projects/my-project-c/secrets/oauth-token/versions/1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details