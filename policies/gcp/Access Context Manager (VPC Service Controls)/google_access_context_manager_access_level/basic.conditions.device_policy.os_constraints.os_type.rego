package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_os_constraints_os_type

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level device policy allows an unapproved operating system type.",
            "remedies": [
                "Set basic.conditions.device_policy.os_constraints.os_type to an approved OS type.",
                "Use approved operating systems such as DESKTOP_WINDOWS, DESKTOP_LINUX, DESKTOP_MAC, or DESKTOP_CHROME_OS."
            ]
        },
        {
            "condition": "Access level device policy must only allow approved operating system types.",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", 0, "os_type"],
            "values": ["DESKTOP_WINDOWS", "DESKTOP_LINUX", "DESKTOP_MAC", "DESKTOP_CHROME_OS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
