package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_exclusion_labels_labels

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Production instances must not be excluded from the security policy",
            "remedies": ["Do not exclude production instances from the security policy"]
        },
        {
            "condition": "Check if production instances are excluded by label",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "instance_filter",
                0,
                "exclusion_labels",
                0,
                "labels"
            ],
            "values": [
                {
                    "environment": "production"
                }
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details