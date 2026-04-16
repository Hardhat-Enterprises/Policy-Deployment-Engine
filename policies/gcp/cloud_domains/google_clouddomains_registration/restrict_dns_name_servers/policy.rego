package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_dns_name_servers

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

# List of authorized name servers (Google Cloud Domains defaults)
authorized_patterns := [".googledomains.com."]

# Helper to check if a name server is authorized
is_authorized(ns) {
    some pattern
    authorized_patterns[pattern]
    endswith(ns, pattern)
}

# Deny if any name server is not authorized
deny[msg] {
    input.resource_type == vars.variables.resource_type
    ns_list := input.resource_config.dns_settings[_].custom_dns[_].name_servers
    some i
    ns := ns_list[i]
    not is_authorized(ns)

    msg := {
        "situation_description": sprintf("Unauthorized name server '%s' detected.", [ns]),
        "remedies": ["Use authorized name servers ending with '.googledomains.com.'"],
        "attribute_path": ["dns_settings", "custom_dns", "name_servers"],
        "values": [ns],
        "policy_type": "whitelist"
    }
}