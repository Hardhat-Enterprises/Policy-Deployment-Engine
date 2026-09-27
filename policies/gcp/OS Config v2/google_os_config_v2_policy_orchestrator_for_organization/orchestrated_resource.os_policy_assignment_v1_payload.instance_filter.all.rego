package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_all

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "The policy must not target all instances indiscriminately",
            "remedies": ["Set the instance filter all attribute to false"]
        },
        {
            "condition": "Check that all instances are not selected",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "instance_filter",
                0,
                "all"
            ],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details