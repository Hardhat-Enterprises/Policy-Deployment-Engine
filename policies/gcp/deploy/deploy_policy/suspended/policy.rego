package terraform.gcp.security.deploy.deploy_policy.suspended # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.deploy_policy.vars


conditions := [
    [
        {
            "situation_description" : "Deploy policy is suspended",
            "remedies":[ "Deploy Policy should not be suspended for active deployment" ]},
        {
            "condition": "Deploy policy is suspended",
            "attribute_path" : ["suspended"], 
            "values" : [false], 
            "policy_type" : "whitelist" 
        }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details