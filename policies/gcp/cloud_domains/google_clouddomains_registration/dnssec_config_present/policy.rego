package terraform.gcp.security.cloud_domains.google_clouddomains_registration.dnssec_config_present

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration does not have DNSSEC (ds_records) configured.",
            "remedies": ["Add 'ds_records' to your 'dns_settings.custom_dns' block to enable DNSSEC."]
        },
        {
            "condition": "Check if DNSSEC ds_records are present",
            "attribute_path": ["dns_settings", 0, "custom_dns", 0, "ds_records", 0],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
