package terraform.gcp.security.cloud_deployment_manager.google_deployment_manager_deployment.create_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_deployment_manager.google_deployment_manager_deployment.vars

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
