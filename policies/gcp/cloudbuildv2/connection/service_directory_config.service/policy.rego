package terraform.gcp.security.cloudbuildv2.connection.service_directory_config.service

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloudbuildv2.connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved SSL CA values",
            "remedies": ["Use approved SSL CA values only"]
        },
        {
            "condition": "Use approved SSL CA values only",
            "attribute_path": ["github_enterprise_config", 0, "ssl_ca"],
            "values": [
                "approved-ca-cert"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details