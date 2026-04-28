package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_data_center_webhook_secret_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved Bitbucket Data Center webhook secret versions",
            "remedies": ["Use approved Bitbucket Data Center webhook secret versions only"]
        },
        {
            "condition": "Use approved Bitbucket Data Center webhook secret versions only",
            "attribute_path": ["bitbucket_data_center_config", 0, "webhook_secret_secret_version"],
            "values": [
                "projects/my-project-c/secrets/webhook-secret/versions/1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details