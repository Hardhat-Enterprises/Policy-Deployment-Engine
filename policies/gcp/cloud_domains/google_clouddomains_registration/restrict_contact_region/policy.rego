package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_contact_region

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration contact region is not allowed.",
            "remedies": ["Set the 'region_code' in 'postal_address' to 'AU'."]
        },
        {
            "condition": "Check registrant contact region",
            "attribute_path": ["contact_settings", "registrant_contact", "postal_address", "region_code"],
            "values": ["AU"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain admin contact region is not allowed.",
            "remedies": ["Set the 'region_code' in 'postal_address' to 'AU'."]
        },
        {
            "condition": "Check admin contact region",
            "attribute_path": ["contact_settings", "admin_contact", "postal_address", "region_code"],
            "values": ["AU"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain technical contact region is not allowed.",
            "remedies": ["Set the 'region_code' in 'postal_address' to 'AU'."]
        },
        {
            "condition": "Check technical contact region",
            "attribute_path": ["contact_settings", "technical_contact", "postal_address", "region_code"],
            "values": ["AU"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
