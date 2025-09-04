package terraform.gcp.security.os_config_v2.policy_orchestrator.action
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "DELETE action is not allowed if state is active and request is made by user to delete the target resource",
    "remedies" : ["Before Deleting any target resource, please contact administrator"]},
    {
        "condition": "Check if the Action is Delete",
        "attribute_path" : ["action"], 
        "values" : ["DELETE"],
        "policy_type" : "Blacklist" 
    },
    {
        "condition": "Check if the Action is Delete",
        "attribute_path" : ["state"], 
        "values" : ["STOPPED"],
        "policy_type" : "Blacklist" 
    }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details