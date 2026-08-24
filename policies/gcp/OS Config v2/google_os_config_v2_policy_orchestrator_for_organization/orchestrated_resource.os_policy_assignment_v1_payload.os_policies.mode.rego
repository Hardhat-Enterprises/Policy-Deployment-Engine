package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_mode

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "The OS policy mode must be ENFORCEMENT to ensure configured security policies are actively applied to target virtual machines.",
            "remedies": ["Set the OS policy mode to ENFORCEMENT"]
        },
        {
            "condition": "Only ENFORCEMENT mode is allowed",
            "attribute_path": ["orchestrated_resource", 0, "os_policy_assignment_v1_payload", 0, "os_policies", 0, "mode"],
            "values": ["ENFORCEMENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details