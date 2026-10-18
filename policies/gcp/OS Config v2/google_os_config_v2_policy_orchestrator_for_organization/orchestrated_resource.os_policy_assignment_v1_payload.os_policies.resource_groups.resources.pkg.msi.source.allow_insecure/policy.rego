package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_pkg_msi_source_allow_insecure

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Only secure MSI package source validation behaviour is allowed",
            "remedies": ["Set allow_insecure to false so MSI packages are subject to source integrity validation"]
        },
        {
            "condition": "MSI package sources must not allow insecure retrieval",
            "attribute_path": ["orchestrated_resource", 0, "os_policy_assignment_v1_payload", 0, "os_policies", 0, "resource_groups", 0, "resources", 0, "pkg", 0, "msi", 0, "source", 0, "allow_insecure"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details