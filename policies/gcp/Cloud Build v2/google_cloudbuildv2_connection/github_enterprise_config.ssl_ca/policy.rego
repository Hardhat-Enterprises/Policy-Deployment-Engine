package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_ssl_ca

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

# Merged policy for `github_enterprise_config.ssl_ca` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
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
    ],
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
