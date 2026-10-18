package terraform.gcp.security.identity_platform.google_identity_platform_config.client_permissions_disabled_user_deletion

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "End users can delete their own Identity Platform accounts through the API.",
            "remedies": [
                "Set client.permissions.disabled_user_deletion to true to protect user records from self-service deletion."
            ]
        },
        {
            "condition": "Self-service user deletion must be disabled",
            "attribute_path": ["client",0,"permissions",0,"disabled_user_deletion"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

