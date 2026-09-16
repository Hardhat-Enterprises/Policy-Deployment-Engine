package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_file_permissions

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "File permissions must not allow group users to write to or execute the file",
            "remedies": ["Use file permissions that restrict group users to read-only or no access"]
        },
        {
            "condition": "Check that the group permission digit does not allow write or execute access",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "os_policies",
                0,
                "resource_groups",
                0,
                "resources",
                0,
                "file",
                0,
                "permissions"
            ],
            "values": ["***", [[], ["2", "3", "5", "6", "7"], []]],
            "policy_type": "pattern blacklist"
        }
    ],
    [
        {
            "situation_description": "File permissions must not allow other users to write to or execute the file",
            "remedies": ["Use file permissions that restrict other users to read-only or no access"]
        },
        {
            "condition": "Check that the other permission digit does not allow write or execute access",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "os_policies",
                0,
                "resource_groups",
                0,
                "resources",
                0,
                "file",
                0,
                "permissions"
            ],
            "values": ["***", [[], [], ["2", "3", "5", "6", "7"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details