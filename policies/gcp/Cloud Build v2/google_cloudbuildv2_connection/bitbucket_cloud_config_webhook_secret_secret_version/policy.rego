package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_cloud_config_webhook_secret_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Ensure Bitbucket Cloud webhook secret version uses the required Secret Manager format",
            "remedies": ["Use webhook_secret_secret_version in the format projects/*/secrets/*/versions/*"]
        },
        {
            "condition": "webhook_secret_secret_version must use approved Secret Manager path format",
            "attribute_path": ["bitbucket_cloud_config", 0, "webhook_secret_secret_version"],
            "values": [
                "projects/*/secrets/*/versions/*",
                [
                    ["my-project-c"],   
                    ["webhook-secret"], 
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