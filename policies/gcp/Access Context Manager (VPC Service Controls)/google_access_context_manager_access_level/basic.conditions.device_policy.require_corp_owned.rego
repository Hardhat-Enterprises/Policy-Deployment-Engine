package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_require_corp_owned

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level device policy does not require a corporate-owned device.",
            "remedies": [
                "Set basic.conditions.device_policy.require_corp_owned to true.",
                "Require corporate-owned devices to reduce access risk from unmanaged or personal devices."
            ]
        },
        {
            "condition": "Access level device policy must require corporate-owned devices.",
            "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "require_corp_owned"],
            "values": true,
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
