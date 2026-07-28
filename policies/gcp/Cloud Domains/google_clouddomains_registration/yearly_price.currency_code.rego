package terraform.gcp.security.cloud_domains.google_clouddomains_registration.yearly_price_currency_code

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration uses a currency other than USD for yearly price.",
            "remedies": ["Update the 'currency_code' in 'yearly_price' to 'USD'."]
        },
        {
            "condition": "Check yearly price currency",
            "attribute_path": ["yearly_price", "currency_code"],
            "values": ["USD"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
