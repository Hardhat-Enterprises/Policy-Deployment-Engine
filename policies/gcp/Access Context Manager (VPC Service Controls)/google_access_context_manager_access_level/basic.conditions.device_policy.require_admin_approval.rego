package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_require_admin_approval

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level device policy does not require admin approval.",
            "remedies": [
                "Set basic.conditions.device_policy.require_admin_approval to true.",
                "Require admin-approved devices to reduce access risk from unmanaged or unverified devices."
            ]
        },
        {
            "condition": "Access level device policy must require admin-approved devices.",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "require_admin_approval"],
            "values": true,
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
