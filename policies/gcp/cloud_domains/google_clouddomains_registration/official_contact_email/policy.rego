package terraform.gcp.security.cloud_domains.google_clouddomains_registration.official_contact_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain contact email does not use an authorized organizational email.",
            "remedies": ["Use an official email address ending with '@example.com'."]
        },
        {
            "condition": "Check registrant contact email",
            "attribute_path": ["contact_settings", 0, "registrant_contact", 0, "email"],
            "values": ["admin@example.com"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain admin contact email does not use an authorized organizational email.",
            "remedies": ["Use an official email address ending with '@example.com'."]
        },
        {
            "condition": "Check admin contact email",
            "attribute_path": ["contact_settings", 0, "admin_contact", 0, "email"],
            "values": ["admin@example.com"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain technical contact email does not use an authorized organizational email.",
            "remedies": ["Use an official email address ending with '@example.com'."]
        },
        {
            "condition": "Check technical contact email",
            "attribute_path": ["contact_settings", 0, "technical_contact", 0, "email"],
            "values": ["admin@example.com"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
