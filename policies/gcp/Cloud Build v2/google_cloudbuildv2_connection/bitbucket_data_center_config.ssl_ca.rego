package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_data_center_config_ssl_ca

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved Bitbucket Data Center SSL CA values",
            "remedies": ["Use approved Bitbucket Data Center SSL CA values only"]
        },
        {
            "condition": "Use approved Bitbucket Data Center SSL CA values only",
            "attribute_path": ["bitbucket_data_center_config", 0, "ssl_ca"],
            "values": [
                "approved-ca-cert"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
