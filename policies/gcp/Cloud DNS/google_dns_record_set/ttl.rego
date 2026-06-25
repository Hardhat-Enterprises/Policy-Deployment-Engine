package terraform.gcp.security.cloud_dns.google_dns_record_set.ttl

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_record_set.vars

conditions := [
    [
        {
            "situation_description": "The DNS record set TTL is too low. A TTL below 300 seconds increases the risk of DNS cache poisoning attacks.",
            "remedies": [
                "Set ttl to at least 300 seconds in the google_dns_record_set resource.",
                "A higher TTL reduces DNS query frequency and improves security.",
                "Consult Google Cloud DNS documentation for recommended TTL values."
            ]
        },
        {
            "condition": "Check if ttl is within the allowed range",
            "attribute_path": ["ttl"],
            "values": [300, 86400],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details