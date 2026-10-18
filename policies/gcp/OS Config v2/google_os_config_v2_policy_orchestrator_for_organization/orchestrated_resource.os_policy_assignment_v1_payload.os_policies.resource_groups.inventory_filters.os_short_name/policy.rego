package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_inventory_filters_os_short_name

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Only Debian machines are allowed to receive the security policy",
            "remedies": ["Use Debian as the operating system for the resource group"]
        },
        {
            "condition": "Check if the operating system is Debian",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "os_policies",
                0,
                "resource_groups",
                0,
                "inventory_filters",
                0,
                "os_short_name"
            ],
            "values": ["Debian"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details