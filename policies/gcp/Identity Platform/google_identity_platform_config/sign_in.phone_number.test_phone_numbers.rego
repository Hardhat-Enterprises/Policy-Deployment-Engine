package terraform.gcp.security.identity_platform.google_identity_platform_config.sign_in_phone_number_test_phone_numbers

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Fixed phone-number verification codes are configured and can bypass normal SMS delivery.",
            "remedies": [
                "Remove all entries from sign_in.phone_number.test_phone_numbers outside controlled testing."
            ]
        },
        {
            "condition": "Test phone numbers must not be configured",
            "attribute_path": ["sign_in",0,"phone_number",0,"test_phone_numbers"],
            "values": [null, {}],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
