package terraform.gcp.security.cloud_domains.google_clouddomains_registration.hsts_preload_enabled

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

# Default to false
default hsts_preload_enabled := false

# Check if HSTS_PRELOADED is in domain_notices
hsts_preload_enabled := true {
    input.resource_type == vars.variables.resource_type
    notices := input.resource_config.domain_notices[_]
    notices == "HSTS_PRELOADED"
}

# Policy Response
deny[msg] {
    input.resource_type == vars.variables.resource_type
    not hsts_preload_enabled

    msg := {
        "situation_description": "Cloud Domain registration does not acknowledge HSTS_PRELOAD_ENABLED notice.",
        "remedies": ["Include 'HSTS_PRELOADED' in the 'domain_notices' list to enhance web security."],
        "attribute_path": ["domain_notices"],
        "values": [],
        "policy_type": "presence"
    }
}