package terraform.gcp.security.cloud_domains.google_clouddomains_registration.dnssec_config_present

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

# Default to false
default dnssec_config_present := false

# Check if DNSSEC (ds_records) is configured
dnssec_config_present := true {
    input.resource_type == vars.variables.resource_type
    dns_settings := input.resource_config.dns_settings[_]
    custom_dns := dns_settings.custom_dns[_]
    ds_records := custom_dns.ds_records
    count(ds_records) > 0
}

# Policy Response
deny[msg] {
    input.resource_type == vars.variables.resource_type
    not dnssec_config_present

    msg := {
        "situation_description": "Cloud Domain registration does not have DNSSEC (ds_records) configured.",
        "remedies": ["Add 'ds_records' to your 'dns_settings.custom_dns' block to enable DNSSEC."],
        "attribute_path": ["dns_settings", "custom_dns", "ds_records"],
        "values": [],
        "policy_type": "presence"
    }
}