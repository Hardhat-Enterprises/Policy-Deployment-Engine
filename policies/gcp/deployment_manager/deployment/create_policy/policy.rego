package terraform.gcp.security.deployment_manager.deployment.create_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deployment_manager.deployment.vars

conditions := [
    [
        {   "situation_description" : "In production, deployments may only acquire existing resources.",
            "remedies":["Set create_policy=ACQUIRE"]
        },
        {
            "condition": "create_policy allowed values",
            "attribute_path" : ["create_policy"],
            "values" : ["ACQUIRE"], 
            "policy_type" : "whitelist" 
        }
    ]
]
   
summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details
