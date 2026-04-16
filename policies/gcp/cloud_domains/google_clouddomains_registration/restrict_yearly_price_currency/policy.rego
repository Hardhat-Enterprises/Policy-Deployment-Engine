package terraform.gcp.security.cloud_domains.google_clouddomains_registration.restrict_yearly_price_currency

import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars as vars

allowed_currency := "USD"

# Default to false
default is_valid_currency := false

is_valid_currency := true {
    input.resource_type == vars.variables.resource_type
    currency := input.resource_config.yearly_price[_].currency_code
    currency == allowed_currency
}

# Policy Response
deny[msg] {
    input.resource_type == vars.variables.resource_type
    not is_valid_currency

    msg := {
        "situation_description": "Cloud Domain registration uses a currency other than USD for yearly price.",
        "remedies": [sprintf("Update the 'currency_code' in 'yearly_price' to '%s'.", [allowed_currency])],
        "attribute_path": ["yearly_price", "currency_code"],
        "values": [],
        "policy_type": "whitelist"
    }
}