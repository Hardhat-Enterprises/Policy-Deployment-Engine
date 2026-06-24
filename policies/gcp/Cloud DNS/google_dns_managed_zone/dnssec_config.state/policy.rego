package terraform.gcp.security.cloud_dns.google_dns_managed_zone.dnssec_config_state

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_managed_zone.vars

conditions := [
    [
        {
            "situation_description": "DNSSEC is not enabled for this DNS managed zone. Without DNSSEC, DNS responses cannot be authenticated, making the zone vulnerable to DNS spoofing and cache poisoning attacks.",
            "remedies": [
                "Set dnssec_config state to 'on' in the google_dns_managed_zone resource.",
                "Enabling DNSSEC ensures DNS responses are cryptographically signed and verified.",
                "Consult Google Cloud DNS documentation for enabling DNSSEC on managed zones."
            ]
        },
        {
            "condition": "Check if dnssec_config state is not set to on",
            "attribute_path": ["dnssec_config", 0, "state"],
            "values": ["on"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
