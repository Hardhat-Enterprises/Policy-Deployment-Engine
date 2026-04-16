package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_dns_name_servers

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration uses unauthorized name servers.",
            "remedies": ["Use authorized name servers ending with '.googledomains.com.'"]
        },
        {
            "condition": "Check name servers from custom_dns",
            "attribute_path": ["dns_settings", "custom_dns", "name_servers"],
            "values": ["ns-cloud-c1.googledomains.com.", "ns-cloud-c2.googledomains.com.", "ns-cloud-c3.googledomains.com.", "ns-cloud-c4.googledomains.com."],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details