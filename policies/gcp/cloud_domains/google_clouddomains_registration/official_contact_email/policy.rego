package terraform.gcp.security.cloud_domains.google_clouddomains_registration.official_contact_email

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

valid_domain := "@example.com"

# Check for invalid registrant contact email
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].registrant_contact[_]
    not endswith(contact.email, valid_domain)

    msg := {
        "situation_description": sprintf("Registrant contact email '%s' is not an official company email.", [contact.email]),
        "remedies": ["Use an email address ending with '@example.com' for all contacts."],
        "attribute_path": ["contact_settings", "registrant_contact", "email"],
        "values": [contact.email],
        "policy_type": "whitelist"
    }
}

# Check for invalid admin contact email
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].admin_contact[_]
    not endswith(contact.email, valid_domain)

    msg := {
        "situation_description": sprintf("Admin contact email '%s' is not an official company email.", [contact.email]),
        "remedies": ["Use an email address ending with '@example.com' for all contacts."],
        "attribute_path": ["contact_settings", "admin_contact", "email"],
        "values": [contact.email],
        "policy_type": "whitelist"
    }
}

# Check for invalid technical contact email
deny[msg] {
    input.resource_type == vars.variables.resource_type
    contact := input.resource_config.contact_settings[_].technical_contact[_]
    not endswith(contact.email, valid_domain)

    msg := {
        "situation_description": sprintf("Technical contact email '%s' is not an official company email.", [contact.email]),
        "remedies": ["Use an email address ending with '@example.com' for all contacts."],
        "attribute_path": ["contact_settings", "technical_contact", "email"],
        "values": [contact.email],
        "policy_type": "whitelist"
    }
}