package terraform.gcp.security.identity_platform.google_identity_platform_config.client_permissions_disabled_user_signup

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "End users can create accounts through self-service Identity Platform APIs.",
            "remedies": [
                "Set client.permissions.disabled_user_signup to true so account creation follows an authorized provisioning process."
            ]
        },
        {
            "condition": "Self-service user signup must be disabled",
            "attribute_path": ["client",0,"permissions",0,"disabled_user_signup"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

