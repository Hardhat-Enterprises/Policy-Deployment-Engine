package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_mode

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The OS policy is left at the unspecified mode sentinel, so it has not been deliberately set to validate or enforce anything on the VM",
    "remedies" : ["Set mode to an explicit value such as VALIDATION or ENFORCEMENT"]},
    {
        "condition": "Check that the OS policy mode is not the unspecified sentinel",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"mode"],
        "values" : ["MODE_UNSPECIFIED"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details