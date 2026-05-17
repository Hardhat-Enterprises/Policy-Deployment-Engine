package terraform.gcp.security.cloud_dns.google_dns_response_policy_rule.dns_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_response_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The DNS response policy rule is using a wildcard dns_name. Wildcard rules match all DNS queries and can override all DNS responses, which is a security risk.",
            "remedies": [
                "Use a specific dns_name instead of a wildcard pattern.",
                "Avoid using wildcard patterns like '*.' in dns_name.",
                "Consult Google Cloud DNS documentation for response policy rule best practices."
            ]
        },
        {
            "condition": "Check if dns_name is in the blocked blacklist",
            "attribute_path": ["dns_name"],
            "values": ["*.", "."],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details