package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_cloud_config_webhook_secret_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved Bitbucket Cloud webhook secret versions",
            "remedies": ["Use approved Bitbucket Cloud webhook secret versions only"]
        },
        {
            "condition": "Use approved Bitbucket Cloud webhook secret versions only",
            "attribute_path": ["bitbucket_cloud_config", 0, "webhook_secret_secret_version"],
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