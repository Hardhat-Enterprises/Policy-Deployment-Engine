package terraform.gcp.security.os_config_v2.policy_orchestrator.action
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "Attribute action to Delete is not allowed",
    "remedies" : ["Before Deleting any target resource, please contact administrator"]},
    {
        "condition": "Check if the Action is Delete",
        "attribute_path" : ["action"], 
        "values" : ["DELETE"],
        "policy_type" : "Blacklist" 
    }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details