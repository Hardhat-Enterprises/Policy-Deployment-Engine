package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_config_app_installation_id

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved GitHub App installation IDs",
            "remedies": ["Use approved GitHub App installation ID range"]
        },
        {
            "condition": "Use approved GitHub App installation ID range",
            "attribute_path": ["github_config", 0, "app_installation_id"],
            "values": [100, 500],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details