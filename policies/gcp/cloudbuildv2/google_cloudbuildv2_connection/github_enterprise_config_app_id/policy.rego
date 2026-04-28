package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_app_id

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved GitHub Enterprise app IDs",
            "remedies": ["Use approved GitHub Enterprise app ID range"]
        },
        {
            "condition": "Use approved GitHub Enterprise app ID range",
            "attribute_path": ["github_enterprise_config", 0, "app_id"],
            "values": [100, 500],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details