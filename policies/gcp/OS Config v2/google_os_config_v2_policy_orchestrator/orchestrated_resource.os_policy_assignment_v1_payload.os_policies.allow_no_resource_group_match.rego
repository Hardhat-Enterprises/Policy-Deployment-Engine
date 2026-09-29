package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_allow_no_resource_group_match

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "A VM is reported as compliant even when none of the policy's resource groups applied to it, so a machine that was never evaluated still passes compliance reporting",
    "remedies" : ["Set allow_no_resource_group_match to false so unmatched VMs are reported as non-compliant"]},
    {
        "condition": "Check that unmatched VMs are not reported as compliant",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"allow_no_resource_group_match"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details