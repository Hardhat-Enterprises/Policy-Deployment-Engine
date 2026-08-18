package terraform.gcp.security.cloud_domains.google_clouddomains_registration.domain_notices

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration does not acknowledge HSTS_PRELOADED notice.",
            "remedies": ["Add 'HSTS_PRELOADED' to the 'domain_notices' list."]
        },
        {
            "condition": "Check if HSTS_PRELOADED notice is acknowledged",
            "attribute_path": ["domain_notices", 0],
            "values": ["HSTS_PRELOADED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
