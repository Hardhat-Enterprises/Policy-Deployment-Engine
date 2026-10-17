package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_pkg_rpm_pull_deps

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Automatic retrieval of RPM package dependencies is not allowed because it can introduce unreviewed dependencies into the managed VM",
            "remedies": ["Set pull_deps to false so RPM dependencies are not automatically retrieved"]
        },
        {
            "condition": "RPM packages must not automatically pull dependencies",
            "attribute_path": ["orchestrated_resource", 0, "os_policy_assignment_v1_payload", 0, "os_policies", 0, "resource_groups", 0, "resources", 0, "pkg", 0, "rpm", 0, "pull_deps"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details