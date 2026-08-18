package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.suspended
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
    {"situation_description" : "Policy is suspended",
    "remedies":[ "Ensure policy is not suspended"]},
    {
        "condition": "Policy is suspended",
        "attribute_path" : ["suspended"],
        "values" : [false],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
