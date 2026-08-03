package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_require_screen_lock

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level device policy does not require screen lock.",
            "remedies": [
                "Set basic.conditions.device_policy.require_screen_lock to true.",
                "Require screen lock to reduce the risk of unauthorized access from unattended devices."
            ]
        },
        {
            "condition": "Access level device policy must require screen lock.",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "require_screen_lock"],
            "values": true,
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
