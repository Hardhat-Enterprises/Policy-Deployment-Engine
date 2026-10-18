package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_folder.action
import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_folder.vars

conditions := [
    [
    {"situation_description" : "DELETE action is not allowed if state is ACTIVE and request is made by user to delete the target resource",
    "remedies" : ["Before Deleting any target resource, please contact administrator"]},
    {
        "condition": "Check if the state is Active",
        "attribute_path" : ["state"], 
        "values" : ["ACTIVE"],
        "policy_type" : "blacklist" 
    },
    {
        "condition": "if the state is Active, then DELETE action is not allowed",
        "attribute_path" : ["action"], 
        "values" : ["DELETE"],
        "policy_type" : "blacklist" 
    },
    
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details