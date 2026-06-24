package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_host_uri

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

# Merged policy for `github_enterprise_config.host_uri` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
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
    ],
[
        {
            "situation_description": "Prevent Terraform from using untrusted host URIs",
            "remedies": ["Avoid using untrusted host URIs"]
        },
        {
            "condition": "Avoid using untrusted host URIs",
            "attribute_path": ["github_enterprise_config", 0, "host_uri"],
            "values": ["http://untrusted-example.com"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
