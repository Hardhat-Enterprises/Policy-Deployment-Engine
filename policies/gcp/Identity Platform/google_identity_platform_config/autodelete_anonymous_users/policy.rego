package terraform.gcp.security.identity_platform.google_identity_platform_config.autodelete_anonymous_users

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Anonymous user accounts are not configured for automatic deletion.",
            "remedies": [
                "Set autodelete_anonymous_users to true so unused anonymous accounts are deleted after 30 days."
            ]
        },
        {
            "condition": "Anonymous user auto-deletion must be enabled",
            "attribute_path": ["autodelete_anonymous_users"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

