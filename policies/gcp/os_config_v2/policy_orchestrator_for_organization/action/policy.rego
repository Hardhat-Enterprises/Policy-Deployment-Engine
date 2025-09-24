package terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.action
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details