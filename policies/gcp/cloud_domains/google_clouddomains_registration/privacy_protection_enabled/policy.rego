package terraform.gcp.security.cloud_domains.google_clouddomains_registration.privacy_protection_enabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration does not have contact privacy enabled",
            "remedies": ["Enable contact privacy by setting 'contact_settings.privacy' to 'PRIVATE_CONTACT_DATA'"]
        },
        {
            "condition": "Check if contact privacy is enabled",
            "attribute_path": ["contact_settings", "privacy"],
            "values": ["PRIVATE_CONTACT_DATA"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
