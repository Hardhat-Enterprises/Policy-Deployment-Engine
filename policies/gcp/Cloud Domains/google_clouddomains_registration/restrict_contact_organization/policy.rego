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
            "attribute_path": ["contact_settings", 0, "registrant_contact", 0, "postal_address", 0, "organization"],
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
            "attribute_path": ["contact_settings", 0, "admin_contact", 0, "postal_address", 0, "organization"],
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
            "attribute_path": ["contact_settings", 0, "technical_contact", 0, "postal_address", 0, "organization"],
            "values": ["Example Corp"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
