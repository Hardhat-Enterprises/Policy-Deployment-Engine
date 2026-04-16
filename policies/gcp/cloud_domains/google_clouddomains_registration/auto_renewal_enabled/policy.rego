package terraform.gcp.security.cloud_domains.google_clouddomains_registration.auto_renewal_enabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration does not have automatic renewal enabled.",
            "remedies": ["Set 'management_settings.preferred_renewal_method' to 'AUTOMATIC_RENEWAL' to prevent domain expiration."]
        },
        {
            "condition": "Check if automatic renewal is enabled",
            "attribute_path": ["management_settings", "preferred_renewal_method"],
            "values": ["AUTOMATIC_RENEWAL"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
