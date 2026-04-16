package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_contact_organization

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration contact organization does not match the corporate requirement.",
            "remedies": ["Set the 'organization' field in 'postal_address' to 'Example Corp'."]
        },
        {
            "condition": "Check registrant contact organization",
            "attribute_path": ["contact_settings", "registrant_contact", "postal_address", "organization"],
            "values": ["Example Corp"],
            "policy_type": "whitelist"
        }
    ],
     [
        {
            "situation_description": "Cloud Domain admin contact organization does not match the corporate requirement.",
            "remedies": ["Set the 'organization' field in 'postal_address' to 'Example Corp'."]
        },
        {
            "condition": "Check admin contact organization",
            "attribute_path": ["contact_settings", "admin_contact", "postal_address", "organization"],
            "values": ["Example Corp"],
            "policy_type": "whitelist"
        }
    ],
     [
        {
            "situation_description": "Cloud Domain technical contact organization does not match the corporate requirement.",
            "remedies": ["Set the 'organization' field in 'postal_address' to 'Example Corp'."]
        },
        {
            "condition": "Check technical contact organization",
            "attribute_path": ["contact_settings", "technical_contact", "postal_address", "organization"],
            "values": ["Example Corp"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details