package terraform.gcp.security.cloud_deployment_manager.google_deployment_manager_deployment.preview
import data.terraform.helpers
import data.terraform.gcp.security.cloud_deployment_manager.google_deployment_manager_deployment.vars

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

details := summary.details
