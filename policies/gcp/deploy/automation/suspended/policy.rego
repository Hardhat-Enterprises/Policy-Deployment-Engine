package terraform.gcp.security.deploy.automation.suspended # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.automation.vars

conditions := [
    [
    {"situation_description" : "Automation is suspended",
    "remedies":[ "Automation should not be suspended for active deployment"]},
    {
        "condition": "Automation is suspended",
        "attribute_path" : ["suspended"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [false], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
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