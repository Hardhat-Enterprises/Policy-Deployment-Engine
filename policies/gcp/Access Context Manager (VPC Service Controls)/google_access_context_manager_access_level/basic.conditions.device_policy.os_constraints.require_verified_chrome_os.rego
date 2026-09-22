package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_os_constraints_require_verified_chrome_os

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Whether Chrome Verified Access is required for Chrome OS devices.",
                "remedies": ["Update require_verified_chrome_os to true."],
        },
        {
                "condition": "require_verified_chrome_os is true",
                "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", 0, "require_verified_chrome_os"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
