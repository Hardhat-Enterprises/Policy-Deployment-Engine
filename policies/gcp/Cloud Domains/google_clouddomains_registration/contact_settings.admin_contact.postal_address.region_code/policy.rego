package terraform.gcp.security.cloud_domains.google_clouddomains_registration.contact_settings_admin_contact_postal_address_region_code

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain admin contact region is not allowed.",
            "remedies": ["Set the 'region_code' in 'postal_address' to 'AU'."]
        },
        {
            "condition": "Check admin contact region",
            "attribute_path": ["contact_settings", 0, "admin_contact", 0, "postal_address", 0, "region_code"],
            "values": ["AU"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details