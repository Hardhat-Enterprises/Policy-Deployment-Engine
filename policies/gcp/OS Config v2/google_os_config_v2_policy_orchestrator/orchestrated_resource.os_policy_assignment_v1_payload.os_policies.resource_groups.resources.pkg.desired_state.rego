package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_pkg_desired_state

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The package is left at the unspecified desired state sentinel, so the agent maintains nothing definite for that package",
    "remedies" : ["Set desired_state to an explicit value such as INSTALLED or REMOVED"]},
    {
        "condition": "Check that the package desired state is not the unspecified sentinel",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"pkg",0,"desired_state"],
        "values" : ["DESIRED_STATE_UNSPECIFIED"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details