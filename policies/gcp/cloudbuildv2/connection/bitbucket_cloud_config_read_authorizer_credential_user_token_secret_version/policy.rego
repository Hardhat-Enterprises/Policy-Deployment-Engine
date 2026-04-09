package terraform.gcp.security.cloudbuildv2.connection.bitbucket_cloud_config_read_authorizer_credential_user_token_secret_version

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloudbuildv2.connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved Bitbucket Cloud authorizer credential user token secret versions",
            "remedies": ["Use approved Bitbucket Cloud authorizer credential user token secret versions only"]
        },
        {
            "condition": "Use approved Bitbucket Cloud authorizer credential user token secret versions only",
            "attribute_path": ["bitbucket_cloud_config", 0, "authorizer_credential", 0, "user_token_secret_version"],
            "values": [
                "projects/my-project-c/secrets/admin-token/versions/1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details