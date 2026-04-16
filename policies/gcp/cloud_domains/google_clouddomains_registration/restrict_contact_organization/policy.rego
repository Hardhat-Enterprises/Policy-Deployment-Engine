package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_contact_organization

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

allowed_org := "Example Corp"

# Helper to check organization in a contact
is_invalid_org(contact) {
    addr := contact.postal_address[_]
    addr.organization != allowed_org
}

# Deny if registrant contact organization is invalid
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].registrant_contact[_]
    is_invalid_org(contact)

    msg := {
        "situation_description": "Registrant contact organization does not match the corporate requirement.",
        "remedies": [sprintf("Set the 'organization' field in 'postal_address' to '%s'.", [allowed_org])],
        "attribute_path": ["contact_settings", "registrant_contact", "postal_address", "organization"],
        "values": [],
        "policy_type": "whitelist"
    }
}

# Deny if admin contact organization is invalid
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].admin_contact[_]
    is_invalid_org(contact)

    msg := {
        "situation_description": "Admin contact organization does not match the corporate requirement.",
        "remedies": [sprintf("Set the 'organization' field in 'postal_address' to '%s'.", [allowed_org])],
        "attribute_path": ["contact_settings", "admin_contact", "postal_address", "organization"],
        "values": [],
        "policy_type": "whitelist"
    }
}

# Deny if technical contact organization is invalid
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].technical_contact[_]
    is_invalid_org(contact)

    msg := {
        "situation_description": "Technical contact organization does not match the corporate requirement.",
        "remedies": [sprintf("Set the 'organization' field in 'postal_address' to '%s'.", [allowed_org])],
        "attribute_path": ["contact_settings", "technical_contact", "postal_address", "organization"],
        "values": [],
        "policy_type": "whitelist"
    }
}