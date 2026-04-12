package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_ssl_ca

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved SSL certificates",
            "remedies": ["Use approved SSL CA certificate only"]
        },
        {
            "condition": "Use approved SSL CA certificate only",
            "attribute_path": ["github_enterprise_config", 0, "ssl_ca"],
            "values": ["approved-ca-cert"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details