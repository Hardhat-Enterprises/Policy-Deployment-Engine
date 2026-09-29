package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_exec_validate_interpreter

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The validate execution stage is left at the unspecified interpreter sentinel, so no interpreter has been deliberately chosen for code that runs on the VM",
    "remedies" : ["Set interpreter to an explicit value such as NONE, SHELL or POWERSHELL"]},
    {
        "condition": "Check that the interpreter is not the unspecified sentinel",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"exec",0,"validate",0,"interpreter"],
        "values" : ["INTERPRETER_UNSPECIFIED"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details