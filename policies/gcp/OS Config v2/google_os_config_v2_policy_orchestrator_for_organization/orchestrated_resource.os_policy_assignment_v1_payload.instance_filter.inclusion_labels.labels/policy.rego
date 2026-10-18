package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inclusion_labels_labels

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Unapproved instances must not be included in the security policy",
            "remedies": ["Use an approved inclusion label for the security policy"]
        },
        {
            "condition": "Check if the inclusion label is unapproved",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "instance_filter",
                0,
                "inclusion_labels",
                0,
                "labels"
            ],
            "values": [
                {
                    "environment": "unapproved"
                }
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details