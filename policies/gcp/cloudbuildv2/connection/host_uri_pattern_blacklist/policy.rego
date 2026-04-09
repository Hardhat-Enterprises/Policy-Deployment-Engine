package terraform.gcp.security.cloudbuildv2.connection.host_uri_pattern_blacklist
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloudbuildv2.connection.vars



conditions := [
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details