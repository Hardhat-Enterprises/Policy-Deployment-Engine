package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_file_permissions

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Overly permissive file modes must not allow unauthorized modification or execution",
            "remedies": ["Use a file permission mode that does not allow unrestricted access such as 777"]
        },
        {
            "condition": "Check that the file permission mode is not 777",
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
            "values": ["777"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details