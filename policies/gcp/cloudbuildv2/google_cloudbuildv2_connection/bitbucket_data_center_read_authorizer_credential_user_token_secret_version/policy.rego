package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_data_center_read_authorizer_credential_user_token_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved Bitbucket Data Center read authorizer credential user token secret versions",
            "remedies": ["Use approved Bitbucket Data Center read authorizer credential user token secret versions only"]
        },
        {
            "condition": "Use approved Bitbucket Data Center read authorizer credential user token secret versions only",
            "attribute_path": ["bitbucket_data_center_config", 0, "read_authorizer_credential", 0, "user_token_secret_version"],
            "values": [
                "projects/my-project-c/secrets/read-token/versions/1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details