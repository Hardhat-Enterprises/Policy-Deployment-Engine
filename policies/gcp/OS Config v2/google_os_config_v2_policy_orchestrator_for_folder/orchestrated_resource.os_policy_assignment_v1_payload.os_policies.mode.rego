package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_folder.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_mode
import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_folder.vars

conditions := [
    [
    {"situation_description" : "OS-Policies does not allow mode to be specific as VALIDATION",
    "remedies" : ["Only use of ENFORCEMENT is allowed to utilize the build feature before deployment"]},
    {
        "condition": "Check if the mode is VALIDATION",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"mode"], 
        "values" : ["VALIDATION"],
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
