package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_allowed_device_management_levels

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level device policy allows devices with an unapproved management level.",
            "remedies": [
                "Set basic.conditions.device_policy.allowed_device_management_levels to COMPLETE.",
                "Require completely managed devices to reduce access risk from unmanaged or partially managed endpoints."
            ]
        },
        {
            "condition": "Access level device policy must only allow completely managed devices.",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_device_management_levels"],
            "values": ["COMPLETE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
