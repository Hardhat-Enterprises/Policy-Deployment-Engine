package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.private_key_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved GitHub Enterprise App IDs",
            "remedies": ["Use approved GitHub Enterprise App IDs only"]
        },
        {
            "condition": "Use approved GitHub Enterprise App IDs only",
            "attribute_path": ["github_enterprise_config", 0, "app_id"],
            "values": [200],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details