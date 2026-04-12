package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.os_type

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Ensure access is only allowed for supported OS types.",
            "remedies": ["Restrict access to approved OS types only."]
        },
        {
            "condition": "os_type is in whitelist",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", 0, "os_type"],
            "values": ["DESKTOP_WINDOWS","DESKTOP_LINUX","DESKTOP_MAC","DESKTOP_CHROME_OS"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Ensure only approved encryption statuses are used.",
            "remedies": ["Restrict to approved encryption levels."]
        },
        {
            "condition": "encryption status is allowed",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_encryption_statuses"],
            "values": ["ENCRYPTED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details