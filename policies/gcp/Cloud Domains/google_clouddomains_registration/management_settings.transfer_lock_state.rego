package terraform.gcp.security.cloud_domains.google_clouddomains_registration.management_settings_transfer_lock_state

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration has Transfer Lock disabled.",
            "remedies": ["Enable transfer lock by setting 'management_settings.transfer_lock_state' to 'TRANSFER_LOCK_ENABLED'."]
        },
        {
            "condition": "Check if transfer lock is enabled",
            "attribute_path": ["management_settings", "transfer_lock_state"],
            "values": ["TRANSFER_LOCK_ENABLED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
