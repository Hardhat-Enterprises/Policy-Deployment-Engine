package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_config_app_installation_id

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using blocked GitHub App installation IDs",
            "remedies": ["Do not use blocked GitHub App installation IDs"]
        },
        {
            "condition": "Do not use blocked GitHub App installation IDs",
            "attribute_path": ["github_config", 0, "app_installation_id"],
            "values": [99999999],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details