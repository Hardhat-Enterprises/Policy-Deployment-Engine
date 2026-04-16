package terraform.gcp.security.cloud_domains.google_clouddomains_registration.official_contact_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

# Note: We use whitelist for the specific approved email in this scenario.
# If multiple emails are allowed, add them to the values list.

conditions := [
    [
        {
            "situation_description": "Cloud Domain contact email does not use an authorized organizational email.",
            "remedies": ["Use an official email address such as 'admin@example.com'."]
        },
        {
            "condition": "Check registrant contact email",
            "attribute_path": ["contact_settings", "registrant_contact", "email"],
            "values": ["admin@example.com"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain admin contact email does not use an authorized organizational email.",
            "remedies": ["Use an official email address such as 'admin@example.com'."]
        },
        {
            "condition": "Check admin contact email",
            "attribute_path": ["contact_settings", "admin_contact", "email"],
            "values": ["admin@example.com"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain technical contact email does not use an authorized organizational email.",
            "remedies": ["Use an official email address such as 'admin@example.com'."]
        },
        {
            "condition": "Check technical contact email",
            "attribute_path": ["contact_settings", "technical_contact", "email"],
            "values": ["admin@example.com"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details