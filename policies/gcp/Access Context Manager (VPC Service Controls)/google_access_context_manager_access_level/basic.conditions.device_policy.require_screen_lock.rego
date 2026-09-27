package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_require_screen_lock

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Whether screen lock is required for the device policy.",
                "remedies": ["Update require_screen_lock to true."],
        },
        {
                "condition": "require_screen_lock is true",
                "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "require_screen_lock"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
