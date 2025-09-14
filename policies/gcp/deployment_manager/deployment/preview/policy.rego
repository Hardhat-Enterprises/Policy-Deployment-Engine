package terraform.gcp.security.deployment_manager.deployment.preview
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deployment_manager.deployment.vars

conditions := [
    [
        {   "situation_description" : "Preview must be disabled in production",
            "remedies":["Set preview=false"]
        },
        {
            "condition": "Preview is enabled",
            "attribute_path" : ["preview"],
            "values" : [true], 
            "policy_type" : "blacklist" 
        }
    ]
]
   
summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details
