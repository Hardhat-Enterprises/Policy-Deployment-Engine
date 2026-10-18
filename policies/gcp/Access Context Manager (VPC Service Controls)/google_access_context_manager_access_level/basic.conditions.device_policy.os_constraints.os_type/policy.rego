package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_os_constraints_os_type

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Ensure Access Context Manager access level conditions do not use an unspecified operating system type.",
                "remedies": ["Update os_type to a supported operating system type instead of OS_UNSPECIFIED."],
        },
        {
                "condition": "os_type is not OS_UNSPECIFIED",
                "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", 0, "os_type"],
                "values": ["OS_UNSPECIFIED"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
