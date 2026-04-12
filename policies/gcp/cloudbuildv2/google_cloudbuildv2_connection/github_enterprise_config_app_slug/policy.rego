package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_app_slug

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved GitHub App slugs",
            "remedies": ["Use approved GitHub App slug only"]
        },
        {
            "condition": "Use approved GitHub App slug only",
            "attribute_path": ["github_enterprise_config", 0, "app_slug"],
            "values": ["gcb-app"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details