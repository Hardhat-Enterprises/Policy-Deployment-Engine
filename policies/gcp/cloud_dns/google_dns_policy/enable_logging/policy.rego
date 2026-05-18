package terraform.gcp.security.cloud_dns.google_dns_policy.enable_logging

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_policy.vars

conditions := [
    [
        {
            "situation_description": "DNS logging is not enabled for this policy. Without logging, DNS queries cannot be audited or monitored for security threats.",
            "remedies": [
                "Set enable_logging to true in the google_dns_policy resource.",
                "Consult Google Cloud DNS documentation for enabling DNS query logging."
            ]
        },
        {
            "condition": "Check if enable_logging is not set to true",
            "attribute_path": ["enable_logging"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details