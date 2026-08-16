package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_all

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "instance_filter.all is true, meaning the OS policy assignment applies to every VM instance in scope with no filtering",
            "remedies": [
                "Set instance_filter.all to false",
                "Use inclusion_labels, exclusion_labels, or inventories to explicitly scope which VMs the OS policies apply to"
            ]
        },
        {
            "condition": "instance_filter.all must not be true (unrestricted VM targeting)",
            "attribute_path": ["orchestrated_resource", 0, "os_policy_assignment_v1_payload", 0, "instance_filter", 0, "all"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details