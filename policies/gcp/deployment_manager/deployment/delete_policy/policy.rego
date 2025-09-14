package terraform.gcp.security.deployment_manager.deployment.delete_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deployment_manager.deployment.vars

conditions := [
    [
        {   "situation_description" : "Safe deletion policy",
            "remedies":["Set delete_policy=DELETE"]
        },
        {
            "condition": "delete_policy allowed values",
            "attribute_path" : ["delete_policy"],
            "values" : ["DELETE"], 
            "policy_type" : "whitelist" 
        }
    ]
]
   
summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details
