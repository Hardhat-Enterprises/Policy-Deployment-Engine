package terraform.gcp.security.cloud_domains.google_clouddomains_registration.privacy_protection_enabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain contact privacy is not set to PRIVATE_CONTACT_DATA or REDACTED_CONTACT_DATA.",
            "remedies": ["Set 'contact_settings.privacy' to 'PRIVATE_CONTACT_DATA' or 'REDACTED_CONTACT_DATA'."]
        },
        {
            "condition": "Check contact privacy settings",
            "attribute_path": ["contact_settings", "privacy"],
            "values": ["PRIVATE_CONTACT_DATA", "REDACTED_CONTACT_DATA"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
