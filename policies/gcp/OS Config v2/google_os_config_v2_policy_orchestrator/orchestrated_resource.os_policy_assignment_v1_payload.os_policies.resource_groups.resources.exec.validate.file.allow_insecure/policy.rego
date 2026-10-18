package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_exec_validate_file_allow_insecure

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "Only secure file validation behaviour is allowed for files used by the validate execution stage",
    "remedies" : ["Set allow_insecure to false so remote files are subject to integrity validation"]},
    {
        "condition": "Check if allow_insecure is false",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"exec",0,"validate",0,"file",0,"allow_insecure"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details