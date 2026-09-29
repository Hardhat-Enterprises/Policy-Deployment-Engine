package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_name

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "An unapproved OS policy assignment name is not allowed because it may cause an unintended policy to be managed",
            "remedies": ["Use the approved OS policy assignment name"]
        },
        {
            "condition": "Check if the OS policy assignment name is unapproved",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "name"
            ],
            "values": ["unapproved-os-policy-assignment"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details