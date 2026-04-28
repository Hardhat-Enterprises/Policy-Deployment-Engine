package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_private_key_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved private key secret versions",
            "remedies": ["Do not use secrets from untrusted projects"]
        },
        {
            "condition": "Do not use secrets from untrusted projects",
            "attribute_path": ["github_enterprise_config", 0, "private_key_secret_version"],
            "values": [
                "projects/my-project-nc/secrets/private-key/versions/1"
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details