package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_contact_region

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

allowed_region := "AU"

# Helper to check region code in a contact
is_invalid_region(contact) {
    addr := contact.postal_address[_]
    addr.region_code != allowed_region
}

# Deny if registrant contact region is invalid
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].registrant_contact[_]
    is_invalid_region(contact)

    msg := {
        "situation_description": "Registrant contact is located in a restricted region.",
        "remedies": [sprintf("Update the region_code to '%s'.", [allowed_region])],
        "attribute_path": ["contact_settings", "registrant_contact", "postal_address", "region_code"],
        "values": [],
        "policy_type": "whitelist"
    }
}

# Deny if admin contact region is invalid
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].admin_contact[_]
    is_invalid_region(contact)

    msg := {
        "situation_description": "Admin contact is located in a restricted region.",
        "remedies": [sprintf("Update the region_code to '%s'.", [allowed_region])],
        "attribute_path": ["contact_settings", "admin_contact", "postal_address", "region_code"],
        "values": [],
        "policy_type": "whitelist"
    }
}

# Deny if technical contact region is invalid
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].technical_contact[_]
    is_invalid_region(contact)

    msg := {
        "situation_description": "Technical contact is located in a restricted region.",
        "remedies": [sprintf("Update the region_code to '%s'.", [allowed_region])],
        "attribute_path": ["contact_settings", "technical_contact", "postal_address", "region_code"],
        "values": [],
        "policy_type": "whitelist"
    }
}