package terraform.gcp.security.identity_platform.google_identity_platform_config.sign_in_anonymous_enabled

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Anonymous user authentication is enabled.",
            "remedies": [
                "Set sign_in.anonymous.enabled to false so users authenticate with an attributable identity."
            ]
        },
        {
            "condition": "Anonymous authentication must be disabled",
            "attribute_path": ["sign_in",0,"anonymous",0,"enabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
