package terraform.gcp.security.cloud_domains.google_clouddomains_registration.auto_renewal_enabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration has automatic renewal disabled",
            "remedies": ["Enable automatic renewal by setting 'management_settings.renewal_method' to 'AUTOMATIC_RENEWAL'"]
        },
        {
            "condition": "Check if automatic renewal is enabled",
            "attribute_path": ["management_settings", "renewal_method"],
            "values": ["AUTOMATIC_RENEWAL"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
