package terraform.gcp.security.deploy.delivery_pipeline.suspended_check
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.delivery_pipeline.vars

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