package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_allowed_encryption_statuses

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level device policy allows devices with unapproved encryption status.",
            "remedies": [
                "Set basic.conditions.device_policy.allowed_encryption_statuses to ENCRYPTED.",
                "Require encrypted devices to reduce the risk of data exposure from lost, stolen, or unmanaged devices."
            ]
        },
        {
            "condition": "Access level device policy must only allow encrypted devices.",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_encryption_statuses"],
            "values": ["ENCRYPTED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
