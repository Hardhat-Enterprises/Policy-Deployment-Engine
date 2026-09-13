package terraform.gcp.security.identity_platform.google_identity_platform_config.sign_in_phone_number_enabled

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Phone-number authentication is enabled.",
            "remedies": [
                "Set sign_in.phone_number.enabled to false to reduce SIM-swap and SMS-pumping exposure."
            ]
        },
        {
            "condition": "Phone-number authentication must be disabled",
            "attribute_path": ["sign_in",0,"phone_number",0,"enabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
