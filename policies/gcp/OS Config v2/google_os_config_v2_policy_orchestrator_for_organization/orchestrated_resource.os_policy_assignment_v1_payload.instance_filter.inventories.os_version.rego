package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inventories_os_version

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Unsupported operating system versions must not receive the security policy",
            "remedies": ["Use the approved operating system version"]
        },
        {
            "condition": "Check if the operating system version is unsupported",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "instance_filter",
                0,
                "inventories",
                0,
                "os_version"
            ],
            "values": ["11"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details