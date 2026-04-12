package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_host_uri
import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars


conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved GitHub Enterprise host URIs",
            "remedies": ["Use approved GitHub Enterprise host URIs only"]
        },
        {
            "condition": "Use approved GitHub Enterprise host URIs only",
            "attribute_path": ["github_enterprise_config", 0, "host_uri"],
            "values": ["https://ghe.example.com"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details