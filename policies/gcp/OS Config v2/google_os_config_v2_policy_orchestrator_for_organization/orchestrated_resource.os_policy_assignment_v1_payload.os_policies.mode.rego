package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_mode

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "os_policies.mode is not set to ENFORCEMENT, meaning the OS policies are only validated (compliance-reported) but never actually applied, creating a false sense of security",
            "remedies": [
                "Set os_policies.mode to ENFORCEMENT so the OS policies are actually applied to target VMs",
                "Use VALIDATION mode only temporarily during testing, not as a long-term configuration"
            ]
        },
        {
            "condition": "os_policies.mode must be ENFORCEMENT",
            "attribute_path": ["orchestrated_resource", 0, "os_policy_assignment_v1_payload", 0, "os_policies", 0, "mode"],
            "values": ["ENFORCEMENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details